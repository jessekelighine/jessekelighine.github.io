#!/usr/bin/env bash

master_link="https://jessekelighine.com/educational-mission"
rss_file="rss.xml"
index_file="index.md"
latest_title="$(cat "$index_file" | grep "^#" | tail -n 2 | head -n 1 | sed -e 's/ *{.*//' -e 's/^# //')"
latest_title_in_rss="$(xmlstarlet select -t -v "/rss/channel/item[1]/title" "$rss_file")"
arrow_echo="$(tput bold && tput setaf 4)==>$(tput sgr0)"
arrow_read="$(tput bold && tput setaf 3)???$(tput sgr0)"

abort () {
	echo "$arrow_echo Aborting..."
	exit 0
}

abort_sigint () {
	printf "\n$arrow_echo Aborting...\n"
	exit 1
}

trap abort_sigint SIGINT

echo "$arrow_echo Latest item in $(basename "$index_file"): $latest_title"
echo "$arrow_echo Latest title in $(basename "$rss_file"): $latest_title_in_rss"
read -p "$arrow_read Action: (1) Add new item? (2) Update latest item? [12]: " -r action

[[ "$action" == "1" ]] && {
	echo "$arrow_echo Adding a new item to $rss_file inplace."

	read -p "$arrow_read New item title (Leave empty to use '$latest_title'): " -r title
	: "${title:=$latest_title}"

	[[ "$title" == "$latest_title_in_rss" ]] && {
		echo "$arrow_echo Title '$title' is already the latest title in $rss_file, please *update* the latest item instead"
		abort
	}

	read -p "$arrow_read New item description (Leave empty to use '$latest_title'): " -r description
	read -p "$arrow_read New item link (Leave empty to use '$master_link'): " -r link
	read -p "$arrow_read New item date (Leave empty to use the time now '$(date -R)'): " -r date
	: "${description:=$latest_title}"
	: "${link:=$master_link}"
	: "${date:=$(date -R)}"

	echo "$arrow_echo New item title: $title"
	echo "$arrow_echo New item description: $description"
	echo "$arrow_echo New item link: $link"
	echo "$arrow_echo New item date: $date"

	read -p "$arrow_read Confirm New Item? [yn]: " -r confirm
	[[ "$confirm" != "y" ]] && abort

	xmlstarlet edit --inplace \
		--update  "/rss/channel/lastBuildDate"                                      --value "$date" \
		--append  "/rss/channel/docs"                --type elem --name item \
		--subnode "/rss/channel/item[1]"             --type elem --name title       --value "$title" \
		--append  "/rss/channel/item[1]/title"       --type elem --name link        --value "$link" \
		--append  "/rss/channel/item[1]/link"        --type elem --name description --value "$description" \
		--append  "/rss/channel/item[1]/description" --type elem --name pubDate     --value "$date" \
		"$rss_file"

	echo "$arrow_echo Added new item to $rss_file"
	exit 0
}

[[ "$action" == "2" ]] && {
	echo "$arrow_echo Updating the latest item in $rss_file inplace."

	original_title="$(xmlstarlet select -t -v "/rss/channel/item[1]/title" "$rss_file")"
	original_description="$(xmlstarlet select -t -v "/rss/channel/item[1]/description" "$rss_file")"
	original_link="$(xmlstarlet select -t -v "/rss/channel/item[1]/link" "$rss_file")"
	original_date="$(xmlstarlet select -t -v "/rss/channel/item[1]/pubDate" "$rss_file")"
	read -p "$arrow_read Updated item title (Leave empty to use orignal '$original_title'): " -r title
	read -p "$arrow_read Updated item description (Leave empty to use orignal '$original_description'): " -r description
	read -p "$arrow_read Updated item link (Leave empty to use original '$original_link'): " -r link
	read -p "$arrow_read Updated item date (Leave empty to use the time now; Original update date: '$original_date'): " -r date
	: "${title:=$original_title}"
	: "${description:=$original_description}"
	: "${date:=$(date -R)}"
	: "${link:=$original_link}"

	echo "$arrow_echo Updated item title: $title"
	echo "$arrow_echo Updated item description: $description"
	echo "$arrow_echo Updated item link: $link"
	echo "$arrow_echo Updated item date: $date"

	read -p "$arrow_read Confirm Updated Item? [yn]: " -r confirm
	[[ "$confirm" != "y" ]] && abort

	xmlstarlet edit --inplace \
		--update "/rss/channel/lastBuildDate"       --value "$date" \
		--update "/rss/channel/item[1]/title"       --value "$title" \
		--update "/rss/channel/item[1]/link"        --value "$link" \
		--update "/rss/channel/item[1]/description" --value "$description" \
		--update "/rss/channel/item[1]/pubDate"     --value "$date" \
		"$rss_file"

	echo "$arrow_echo Updated latest item in $rss_file"
	exit 0
}

abort
