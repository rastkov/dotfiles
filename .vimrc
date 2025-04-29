" disable vi compatibility
set nocompatible

" turn filetype detection off and, even if it's not strictly
" necessary, disable loading of indent scripts and filetype plugins
" filetype off
" filetype plugin indent off

" pathogen runntime injection and help indexing
"call pathogen#infect()
"call pathogen#helptags()
execute pathogen#infect()

" turn filetype detection, indent scripts and filetype plugins on
" and syntax highlighting too
filetype plugin indent on
syntax on

au BufNewFile,BufRead *.html,*.htm,*.shtml,*.stmi,*.sls set ft=jinja
colorscheme wombat256

" fly to your buffers https://stackoverflow.com/questions/38751128/vim-and-nerdtree-clear-no-name-from-buffers
nnoremap <leader>b :ls<cr>:b<space>

set incsearch                     " set incremental search (good for highlighting)
"set highlight                     " highlight all search maches

set hidden

set nowrap                        " don't wrap lines
set tabstop=2                     " a tab is four spaces
set shiftwidth=2                  " an autoindent
set expandtab                     " use spaces, not tabs
"set list                          " Show invisible characters
set backspace=indent,eol,start    " backspace through everything in insert mode
"set t_ut=""                       " fix filling of empty space by red bar https://github.com/microsoft/terminal/issues/832#issuecomment-493747616
set number                        " with relativenumber set, number is not shown - either toggle relativenumber to see number
set relativenumber

set autochdir                     " use current working dir for each file - usefull in splits/tabs
set splitbelow                    " control the way splits are opened

:set indentkeys-=0#               " don't indent when addind comments

" Easier split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Override vim default split behavior
set splitbelow
set splitright

function Paste()
    :set paste
endfunction
map <F12> :call Paste()<CR>

" CtrlP configuration
let g:ctrlp_working_path_mode = 'ra'

" vim-airline configuration
let g:airline_symbols = {}
let g:airline_theme="wombat"
let g:airline_powerline_fonts = 0
let g:airline_left_sep = ""
let g:airline_right_sep = ""
" unicode symbols
let g:airline_symbols.linenr = ' '
let g:airline_symbols.maxlinenr = ' '
let g:airline_symbols.branch = ''
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" NERDTree Configurations
let g:NERDTreeChDirMode = 3
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
" nnoremap <C-f> :NERDTreeFind<CR>

function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()
