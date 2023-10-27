runtime! debian.vim
"let g:skip_defaults_vim=1
"===========================
"===========================================================================
"=============================== BASIC SETTINGS============================
"=====================================================================
filetype plugin indent on
highlight SpellBad ctermfg=Black ctermbg=Red
hi StatusLine gui=reverse cterm=reverse
set autoread
set backup
set browsedir=current
set clipboard=unnamedplus
set encoding=utf-8
set hidden
set history=128
set mouse=a
set nocompatible
set noswapfile
set sessionoptions=curdir,buffers,tabpages
set t_Co=256
set termencoding=utf-8
set title
set undolevels=2048
"set number
" Use persistent history.
if !isdirectory("/tmp/.vim-undo-dir")
    call mkdir("/tmp/.vim-undo-dir", "", 0700)
endif
set undodir=/tmp/.vim-undo-dir
set undofile
" end history
"=============================================================================
"============================== EDITOR SETTINGS ==============================
"=============================================================================
autocmd CursorMoved * silent! exe printf("match Search /\\/", expand(''))
let c_syntax_for_h=""
let python_highlight_all = 1
set backspace=indent,eol,start
set laststatus=2
set linebreak
set list
set listchars=tab:>-,trail:-
set mps+=
set noruler
"set number
set scrolloff=4
set showcmd
set showmatch
set textwidth=80
set visualbell
set wrap
syntax enable
"===========================================================================
"=============================== COLORSCHEME ===============================
"===========================================================================
if empty(glob('/usr/share/vim/vim82/colors/sublimemonokai.vim'))
silent !curl -fLo /usr/share/vim/vim82/colors/sublimemonokai.vim --create-dirs
\ https://raw.githubusercontent.com/ErichDonGubler/vim-sublime-monokai/master/colors/sublimemonokai.vim
endif
set background=dark
colorscheme sublimemonokai
"===========================================================================
"========================== INDENTATION SETTINGS ===========================
"===========================================================================
set autoindent
set expandtab
set pastetoggle=
set shiftwidth=4
set smarttab
set smartindent
set softtabstop=4
set tabstop=4
au FileType crontab,fstab,make set noexpandtab tabstop=8 shiftwidth=8
au FileType *.htm,*.html,*.css,*.js set softtabstop=2 tabstop=2 shiftwidth=2 textwidth=120

"========
"fzf
 set rtp+=/home/dafr/.linuxbrew/opt/fzf
"===========================================================================
"=================== AUTO-COMPLETION OF INPUT (omnifunct) ==================
"===========================================================================
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType tt2html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
set completeopt=menu

"===========================================================================
"==================== COLLAPSING TEXT BLOCKS (folding) =====================
"===========================================================================
set foldenable
"set foldmethod=syntax
set foldmethod=indent
set foldcolumn=1
set foldlevel=2
"set foldopen=all
set tags=tags\ $VIMRUNTIME/systags

"===========================================================================
"======================== FILE MANAGEMENT SETTINGS =========================
"===========================================================================
set fileformat=unix
set fencs=utf-8,cp1251,koi8-r,cp866
autocmd! bufwritepre $MYVIMRC call setline(1, '"" Last update: '.strftime("%d.%m.%Y %H:%M"))
filetype on
filetype plugin on
filetype indent on
autocmd FileType perl call SetPerlConf()
set path=.,,**

"===========================================================================
"=========================== TEXT SEARCH SETTINGS ==========================
"===========================================================================
"map /
"map ?
set ignorecase
set incsearch
set nohlsearch
set smartcase
vnoremap * :call VisualSearch()//
vnoremap # :call VisualSearch()?/

"===========================================================================
"=============================== PLUGINS ===================================
"===========================================================================
if empty(glob('/usr/share/vim/vim82/autoload/plug.vim'))
silent !curl -fLo /usr/share/vim/vim82/autoload/plug.vim --create-dirs
\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('/usr/share/vim/vim82/bundle')

"""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""" Code/Project Navigation """"""""""
"""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'scrooloose/nerdtree' "
Plug 'jistr/vim-nerdtree-tabs' "
Plug 'majutsushi/tagbar' "
"""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""" AWK """"""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'vim-scripts/awk.vim' "
"""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""" HTML/CSS/XML """""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'tpope/vim-surround' "
Plug 'othree/html5.vim' "
Plug 'hail2u/vim-css3-syntax' "
Plug 'shmargum/vim-sass-colors' "
Plug 'ap/vim-css-color' "
Plug 'Ioannis-Kapoulas/vim-autoprefixer' "
Plug 'othree/xml.vim' "
"""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""" Java """"""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'uiiaoo/java-syntax.vim' "
"""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""" JavaScript """"""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'pangloss/vim-javascript' "
Plug 'jelera/vim-javascript-syntax' "
"""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""" Nginx """""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'chr4/nginx.vim' "
"""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""" PHP """"""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'stanangeloff/php.vim' "
Plug 'phpactor/phpactor' "
"""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""" Python """"""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'klen/python-mode' "
Plug 'nvie/vim-flake8' "
Plug 'mitsuhiko/vim-jinja' "
"""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""" Ruby """"""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""
"Plug 'vim-ruby/vim-ruby' "
"Plug 'tpope/vim-rails' "
Plug 'slim-template/vim-slim', { 'for': 'slim' }
Plug 'tpope/vim-endwise', { 'for': 'ruby' }
Plug 'tpope/vim-haml', { 'for': 'haml' }
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' },
Plug 'vim-utils/vim-ruby-fold', { 'for': 'ruby' },
Plug 'thoughtbot/vim-rspec' "
"""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""" Other """""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""
Plug '907th/vim-auto-save' "
Plug 'vim-syntastic/syntastic' "
"Plug 'ycm-core/YouCompleteMe' "
Plug 'tpope/vim-fugitive' "
Plug 'airblade/vim-gitgutter' "
Plug 'fisadev/FixedTaskList.vim' "
"Plug 'vim-scripts/taglist.vim' "
Plug 'frazrepo/vim-rainbow' "
Plug 'itchyny/lightline.vim' "
Plug 'preservim/nerdcommenter' "
"""""""""""""""""""""""""""""""""""""""""""""""""
" colorschemes
Plug 'morhetz/gruvbox'
Plug 'chriskempson/base16-vim'
Plug 'dracula/vim', { 'as': 'dracula' }

call plug#end()
"colorscheme dracula
"=============================================================================
"=============================== PLUGIN SETTINGS =============================
"=============================================================================

"""""""""""""""""""""""""""""""""""""""
""""""""""""""" NERDTree """"""""""""""
"""""""""""""""""""""""""""""""""""""""
autocmd vimenter * NERDTree
autocmd VimEnter * wincmd l
"map :NERDTreeToggle
:let g:NERDTreeWinSize=24
let NERDTreeIgnore=['\.pyc$', '\~$']
let NERDTreeMapOpenInTab='\r'

"""""""""""""""""""""""""""""""""""""""
"""""""""""""" Syntastic """"""""""""""
"""""""""""""""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"""""""""""""""""""""""""""""""""""""""
"""""""""""" FixedTaskList """"""""""""
"""""""""""""""""""""""""""""""""""""""
"map :TaskList

"*last-position-jump*
"   This autocommand jumps to the last known position in a file
"   just after opening it, if the '" mark is set:

:au BufReadPost *
   \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit'
   \ |   exe "normal! g`\""
   \ | endif

let g:completor_ruby_omni_trigger = '([$\w]{1,}|\.[\w]*|::[$\w]*)$'

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

