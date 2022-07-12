set nu
syntax on
nnoremap <C-n> :NERDTree<CR>
set smartindent
filetype plugin on
inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}
inoremap (      ()<Left>
inoremap <expr> )  strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
"inoremap '      ''<Left>
"inoremap <expr> ' strpart(getline('.'), col('.')-1, 1) == "\'" ? "\<Right>" : "\'\'\<Left>"
"inoremap "      ""<Left>
"inoremap <expr> " strpart(getline('.'), col('.')-1, 1) == "\"" ? "\<Right>" : "\"\"\<Left>"
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle
"colorscheme darcula
set mouse=a
let g:NERDTreeWinSize=20
" Open the existing NERDTree on each new tab.
"autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
" Mirror the NERDTree before showing it. This makes it the same on all tabs.e
colorscheme darcula
set mouse=a
let g:NERDTreeWinSize=20
" Open the existing NERDTree on each new tab.
"autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
 "Mirror the NERDTree before showing it. This makes it the same on all tabs.
"nnoremap <C-n> :NERDTreeMirror<CR>:NERDTreeFocus<CR>


" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
set title


function MoveToNextTab()
  "there is only one window
  if tabpagenr('$') == 1 && winnr('$') == 1
    return
  endif
  "preparing new window
  let l:tab_nr = tabpagenr('$')
  let l:cur_buf = bufnr('%')
  if tabpagenr() < tab_nr
    close!
    if l:tab_nr == tabpagenr('$')
      tabnext
    endif
    sp
  else
    close!
    tabnew
  endif
  "opening current buffer in new window
  exe "b".l:cur_buf
endfunc

map <C-m> :call MoveToNextTab()<CR><C-w>H
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
"nmap <C-i> <C-w><C-T>

nnoremap t gt
nnoremap T gT
nnoremap L ml:execute 'match Search /\%'.line('.').'l/'<CR>
function Glass()
	hi! Normal ctermbg=NONE guibg=NONE
endfunc

function Light()
	set termguicolors
	colorscheme autumnleaf
endfunc
