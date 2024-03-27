" .vimrc

call textoggle#Set("pre",1)
call textoggle#Set("notes",1)
call textoggle#Reload(0)

nnoremap <buffer> <F5> :call tex#Compile("make","jobstart")<CR>
nnoremap <buffer> <F6> :call tex#Compile("make","termopen")<CR>
