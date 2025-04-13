#!/usr/bin/env bash

###############################################################################
# -*- encoding: UTF-8 -*-                                                     #
# Author: Jesse C. Chen (https://jessekelighine.com)                          #
# Description: Generate HTML file for redirection.                            #
#                                                                             #
# Last Modified: 2024-09-01                                                   #
###############################################################################

output="index-output.html"
placeholder="THIS_IS_A_UNIQUE_PLACEHOLDER_THAT_CONTAINS_NO_SPECIAL_CHARACTERS"
template=$(cat << EOF
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="refresh" content="0; url=${placeholder}" />
		<link rel="stylesheet" href="style.css" />
	</head>
	<body>
		<p>
			<strong>Note:</strong>
			You should be redirected automatically.
			Or click <a href="${placeholder}"><code>here</code></a>.
		</p>
	</body>
</html>
EOF
)

[ $# -eq 0 ] && {
	echo "error: insufficient arguments"
	echo "usage: $0 [PATH/URL]"
	exit 1
}

echo "${template}" > "${output}"
sed -i '' "s?${placeholder}?${1//\?/\\?}?g" "${output}"
exit 0
