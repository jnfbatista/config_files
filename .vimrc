if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'w0rp/ale'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-vinegar'
Plug 'Townk/vim-autoclose'

Plug 'vim-test/vim-test'
Plug 'tpope/vim-dispatch'

Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

Plug 'tpope/vim-rails'
Plug 'direnv/direnv.vim'

Plug 'guns/vim-clojure-static'
Plug 'tpope/vim-fireplace'
Plug 'luochen1990/rainbow'

Plug 'metakirby5/codi.vim'
Plug 'airblade/vim-gitgutter'

Plug 'hardhackerlabs/theme-vim', { 'as': 'hardhacker' }
Plug 'haishanh/night-owl.vim'

call plug#end()

let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚠'
hi ALEErrorSign ctermfg=1
hi ALEWarningSign ctermfg=3

filetype plugin indent on

let &t_Co=256
let t_Co=256
syntax on

set autoindent
set nocompatible

set encoding=utf-8
set list
set list listchars=trail:·,nbsp:~,
set tabstop=2
set ruler
set laststatus=2
set softtabstop=2
set shiftwidth=2
set expandtab
set nowrap
set guioptions-=r
set guioptions-=l
set colorcolumn=80
set guioptions-=b
set guioptions-=T
set incsearch
set cursorline
set backspace=indent,eol,start
set showmatch
set nobackup
set noswapfile
set number
set autoread
set clipboard=unnamed

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_root_markers = ['.git', '.hg', 'Rakefile']

" use ripgrep to search files in ctrlp
if executable('rg')
  let g:ctrlp_user_command = "rg %s --files --hidden -g '!.git/' --color=never --glob \"\""
endif

let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

" Show Marks
let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
let g:showmarks_enable = 1
highlight ShowMarksHLl gui=bold guibg=LightBlue guifg=Blue
highlight ShowMarksHLu gui=bold guibg=LightRed guifg=DarkRed
highlight ShowMarksHLo gui=bold guibg=LightYellow guifg=DarkYellow
highlight ShowMarksHLm gui=bold guibg=LightGreen guifg=DarkGreen

" Omni complete on tab
function! SuperCleverTab()
  if strpart(getline('.'), 0, col('.') - 1) =~ '^\s*$'
    return "\<Tab>"
  else
    return "\<C-N>"
  endif
endfunction
inoremap <Tab> <C-R>=SuperCleverTab()<cr>

if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
end

autocmd BufNewFile,BufReadPost *.cljx setfiletype clojure
autocmd BufNewFile,BufReadPost *.cljc setfiletype clojure
autocmd BufNewFile,BufReadPost *.pxi setfiletype clojure

" make test commands execute using dispatch.vim
let test#strategy = "vimterminal"

let mapleader = ","

map <Leader>l :TestLast <CR>
map <Leader>n :TestNearest <CR>
map <Leader>t :TestFile <CR>

nmap <silent> t<C-n> :TestNearest<CR> " t Ctrl+n
nmap <silent> t<C-f> :TestFile<CR>    " t Ctrl+f
nmap <silent> t<C-s> :TestSuite<CR>   " t Ctrl+s
nmap <silent> t<C-l> :TestLast<CR>    " t Ctrl+l
nmap <silent> t<C-g> :TestVisit<CR>   " t Ctrl+g

" spell check
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd FileType gitcommit setlocal spell

syntax on
colorscheme Tomorrow-Night
