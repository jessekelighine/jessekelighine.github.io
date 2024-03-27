" vimrc

" let s:temp_labsfiles = substitute(system("find . | grep '\.tex$'"),"\n",' ','g')
" let s:temp_bibsfiles = substitute(system("find . | grep '\.bib$'"),"\n",' ','g')
" call texcomplete#SetFiles('labs',s:temp_labsfiles)
" call texcomplete#SetFiles('bibs',s:temp_bibsfiles)

call textoggle#Clear()
" call textoggle#Set('fig', 1)
" call textoggle#Set('ref', 1)
call textoggle#Set('notes', 1)
" call textoggle#Set('tex', 1)
" call textoggle#Set('doc', 1)
call textoggle#Set('pre', 1)
" call textoggle#Set('beamer', 1)
" call textoggle#Set('tikz', 1)
call textoggle#Reload(0)

" nnoremap <buffer> <F5> :call tex#Compile("make",'jobstart')<CR>
" nnoremap <buffer> <F6> :call tex#Compile("make",'termopen')<CR>
