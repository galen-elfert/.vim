set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Add plugins here:
Plugin 'ervandew/supertab'
Plugin 'Valloric/YouCompleteMe'
"Plugin 'altercation/vim-colors-solarized'
Plugin 'wincent/Command-T'
Plugin 'vim-scripts/L9'
Plugin 'vim-scripts/FuzzyFinder'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
" Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'rdnetto/YCM-Generator'
Plugin 'rking/ag.vim'
Plugin 'tpope/vim-surround'
Plugin 'reedes/vim-pencil'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
 let g:UltiSnipsExpandTrigger = "<tab>"
 let g:UltiSnipsJumpForwardTrigger = "<tab>"
 let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Syntastic setup:
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
set statusline=%F\ %y%=\[%c\]\ %l/%L
set laststatus=2

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_pylint_args = '--rcfile=/home/gelfert/.pylintrc'

:nnoremap <leader>sc :SyntasticCheck<CR>
:nnoremap <leader>st :SyntasticToggleMode<CR>

" increase max files for command-t
let g:CommandTMaxFiles=15000
let g:CommandTMaxDepth=10
let g:CommandTTraverseSCM='pwd'

" Fix utf-8 interpretation
scriptencoding utf-8
set encoding=utf-8

" Detect other filetypes
augroup filetypedetect
  au! BufRead,BufNewFile *.m,*.oct set filetype=octave
  au! BufNewFile,BufRead *.i set filetype=swig 
  au! BufNewFile,BufRead *.swg set filetype=swig
augroup END

" Pencil plugin settings
augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
  autocmd FileType text         call pencil#init({'wrap': 'hard'})
  autocmd FileType markdown,mkd,text set tw=79
augroup END

" wildignore settings, mostly for command-t to avoid third-part repo dir
set wildignore+=*/third_party/*,*/TCNG_ASIC/*
" syntax highlighting
syntax on
" Turn on line numbers
set nu
" Turn on the ruler
set ruler
" Search highlghting
set hlsearch
nnoremap <leader>h :noh<cr>
" Use tabs instead of spaces
set noexpandtab
" line wrap
set nowrap
" Automatically indent lines following indents
set autoindent
" Set indent settings
set expandtab
set shiftwidth=4
set softtabstop=4
" Change line number style in normal and insert mode
set number
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber

set backspace=2

" set list listchars=tab:▸\ ,trail:·

" Mappings
" Define <leader>
:let mapleader = ","

" Substitute escape
inoremap <leader>m <esc>

" Length of scroll up and down:
nnoremap <C-e> 4<C-e>
nnoremap <C-y> 4<C-y>

" Edit and source ~/.vimrc
nnoremap <leader>ev :sp $MYVIMRC<cr>
nnoremap <leader>sv :so $MYVIMRC<cr>

" Buffer forward and back
nnoremap <leader>j :bn<cr>
nnoremap <leader>k :bp<cr>

" Fuzzyfinder mappings
nnoremap <leader>f :FufFile <cr>
nnoremap <leader>d :FufDir <cr>

" Autocommands for Octave/Matlab files:
" :autocmd BufNewFile,BufRead

" FileType specific:
au FileType Makefile set tabstop=8 shiftwidth=8 softtabstop=8 noexpandtab

" Special gui stuff:
if has("gui_running")
  let g:gruvbox_bold=0
  let g:gruvbox_contrast_dark='hard'
  let g:gruvbox_contrast_light='medium'
  colorscheme gruvbox
  set background=dark
  "set guifont=ProggyCeanTT\ 13
  " autocmd VimEnter * :NERDTree
  " gvim system paste:
  nnoremap <leader>p "+gP
  inoremap <C-v> <esc>l"+gPa
  set guioptions-=T
else
  colorscheme koehler
endif

" OS specific
if has("unix")
  let s:uname = system("uname -s")
  if s:uname == "Darwin\n"
    " Do Mac stuff here
    set guifont=ProggyCleanTT:h16
  set noantialias
  endif
  if s:uname == "Linux\n"
    set guifont=ProggyCeanTT\ 13
  endif
endif
