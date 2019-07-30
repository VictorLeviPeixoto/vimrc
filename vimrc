runtime! debian.vim

if has("syntax")
  syntax on
endif

if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

call plug#begin('~/.vim/plugged')

Plug 'itchyny/vim-gitbranch'
Plug 'w0rp/ale'
Plug 'itchyny/lightline.vim'
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }

Plug 'xuyuanp/nerdtree-git-plugin'
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }
let g:NERDTreeShowIgnoredStatus = 1

Plug 'scrooloose/nerdtree'
map <C-n> :NERDTreeToggle<CR>

Plug 'airblade/vim-gitgutter'
highlight GitGutterAdd    guifg=#009900 guibg=#073642 ctermfg=2 ctermbg=000
highlight GitGutterChange guifg=#bbbb00 guibg=#073642 ctermfg=3 ctermbg=000
highlight GitGutterDelete guifg=#ff2222 guibg=#073642 ctermfg=1 ctermbg=000
autocmd BufWritePost * GitGutter

Plug 'raimondi/delimitmate'

if !has('gui_running')
  set t_Co=256
endif

call plug#end()

set number
set tabstop=2
set shiftwidth=2
let mapleader=","
