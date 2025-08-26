" Highlight whitespace at the end of lines.
" 1) Define a highlight group
highlight ExtraWhitespace ctermbg=darkred guibg=#552222

" 2) Pattern:
"    - \s\+$                      → trailing spaces at end of line
"    - \S\zs\s\+\ze[)\]}.,;]      → spaces AFTER a non-space, just before ) ] } , . ;
"    - ["],\zs\s\+$               → spaces after , or " at EOL
let g:extra_ws_pat = '\s\+$\|\S\zs\s\+\ze[)\]}.,;]\|["],\zs\s\+$'

" 3) Apply it (matchadd survives many redraws better than :match)
call matchadd('ExtraWhitespace', g:extra_ws_pat, 10)

" Highlight lines that only contain spaces
highlight OnlySpaces ctermbg=red guibg=red
match OnlySpaces /^\s\+$/

