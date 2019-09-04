set foldlevel=0
set spell spelllang=de_de

unmap <leader>f
" Format Paragraph
noremap <silent> <leader>f :let _pos = getcurpos() <Bar><CR>
	\ {gq}<CR>
	\ :call setpos('.', _pos) <Bar>
	\ :unlet _pos <CR>
