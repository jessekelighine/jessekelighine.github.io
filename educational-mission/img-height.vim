" img-height.vim

" Wrap the image path in an HTML/Markdown image tag with lazy loading and 
" aspect ratio. This function is needed for lazy loading images in HTML so
" that the page layout does not jump around when the image loads.
"
" @param file_path string path to an image file.
" @return string HTML/Markdown formatted image with lazy loading and aspect ratio.
function! <SID>Wrapper(file_path)
	let l:aspect_ratio = system("identify -format '%w/%h' " .. a:file_path)
	return '<img src="' .. a:file_path .. '" loading="lazy" style="aspect-ratio: ' .. l:aspect_ratio .. ';" />'
	return '![](' .. a:file_path .. '){loading=lazy style="aspect-ratio: ' .. l:aspect_ratio .. ';"}'
endfunction

command! -range Img :keeppatterns '<,'>s/\%V.*\%V./\=<SID>Wrapper(submatch(0))/
