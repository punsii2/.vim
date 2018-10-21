" +-----------------------------------------------------------------------+
" |  Vundle                                                               |
" +-----------------------------------------------------------------------+

" Setting up Vundle - the vim plugin bundler
let vundleIsSetup=1
let vundle_readme=expand('~/.vim/bundle/Vundle.vim/README.md')

" Clone Vundle manually if not present
if !filereadable(vundle_readme)
	echo "Installing Vundle.."
	echo ""
	silent !mkdir -p ~/.vim/bundle
	silent !git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	let vundleIsSetup=0
endif

" Vim.
set nocompatible

" Must be off before Vundle runs
filetype off

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Asynchronous Lint Engine (ALE)
Plugin 'w0rp/ale'

" Colorscheme
Plugin 'altercation/vim-colors-solarized'
" Neat Status Line
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Tags
Plugin 'taglist.vim'

" Pair braces gracefully
Plugin 'jiangmiao/auto-pairs'

set tags=./tags;			" search tags files upwards
set csto=1				" prefer tags DBs over cscope DBs
let Tlist_WinWidth = 50
let Tlist_Close_On_Select=1

" Install plugins after fresh start
if vundleIsSetup == 0
	echo "Installing Vundles, please ignore key map error messages"
	echo ""
	:PluginInstall
endif

" Fast file navigation XXX Needs Ruby installation
" Plugin 'git://git.wincent.com/command-t.git'

" Add all Plugins before this
call vundle#end()

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" +-----------------------------------------------------------------------+
" |  General                                                              |
" +-----------------------------------------------------------------------+

" Vim.
set nocompatible

" Reenable filetype
filetype plugin indent on

" Explicitly define xterm as environment
behave xterm

" More screen updates
set ttyfast

" Set to utf8 encoding
set encoding=utf-8

" Enable mouse
set mouse=a

" Show current mode (INSERT/REPLACE/...)
set showmode

" No exec
set secure

" Flashing lights...
" XXX not sure about this one
set visualbell

" Representation of nvisible characters, if :set list
set listchars=tab:\>-,trail:.
" Show listchars
set list

" Saved history
set history=2048
set undolevels=2048

" Use global clipboard
set clipboard=unnamedplus

" Open a splitted window to the right
set splitright

" Tab settings
set noexpandtab
" Size of real Tabs
set tabstop=8
" Indent amount when using cindent, >>, ..
set shiftwidth=8
" Indent amount when using TAB
set softtabstop=4

" +-----------------------------------------------------------------------+
" |  Search                                                               |
" +-----------------------------------------------------------------------+

" Highlight search
set hlsearch

" Start incremental search on typing
set incsearch

" Match case if searchstring starts with uppercase
" smartcase doesn't work without ignorecase
set ignorecase
set smartcase

" Show information about current command
set showcmd

" Read file when changed only outside of vim
set autoread

" Where to break lines at 'breakat' chars
set breakat=\
set linebreak

" 'Showbreak' is displayed to the left of wrapping lines
set showbreak=>>
" Distance from right border before wrapping starts
" Probably not needed
" set wrapmargin=2

" Break after 80 chars
set textwidth=80

" Allow backspacing over everything
set backspace=indent,eol,start

" automatically indent on next line
set autoindent
" try to guess beginning of next line
set smartindent

" Settings for perl.vim
let perl_want_scope_in_variables = 1
let perl_extended_vars = 1
let perl_want_scope_in_variables = 1

" +-----------------------------------------------------------------------+
" |  Syntaxhighlighting                                                   |
" +-----------------------------------------------------------------------+

" Solarized Plugin
syntax enable
set background=light
" set if terminal colors are not set
" let g:solarized_termcolors=256
colorscheme solarized

function! CustomHi()
	" Highlight column 81
	set colorcolumn=81

	hi OverLength ctermbg=red guibg=red
	match OverLength /\%>80v.\+/
	hi TrailingWhitespace ctermbg=red guibg=red
	match TrailingWhitespace /\s\+$/
endfunction

call CustomHi()

" Show matches (braces, quotes etc.) briefly
set showmatch

" Always display statusline in all windows
set laststatus=2
" Show coursor position in status line
set ruler
" Show line numbers
set number

" " highlight extra whitespaces
" highlight ExtraWhitespace ctermbg=red guibg=red
" match ExtraWhitespace /\v\s+$| +\ze\t|\S\zs\t+ +|^\s*( {8})+/

" +-----------------------------------------------------------------------+
" |  Mappings                                                             |
" +-----------------------------------------------------------------------+

" courser at bottom
vnoremap y y`]
" courser at last position
" vmap y ygv<Esc>

" open definition in new tab
noremap <C-\> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

noremap <F3> :TlistToggle<cr><C-w>10h
noremap <F4> :TlistToggle<cr>
call togglebg#map("")
map <silent> <F5> :ToggleBG<cr>
	\ :execute 'call CustomHi()'<cr>

" map <F> :!/usr/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" remove trailing whitespace, dont highlight while searching and restore
" search-register and cursor position afterwards.
noremap <silent> <F7> :let _pos = getcurpos() <Bar>
	\ :let _s=@/ <Bar>
	\ :%s/\s\+$//e <Bar>
	\ :let @/=_s <Bar>
	\ :nohl <Bar>
	\ :unlet _s <Bar>
	\ :call setpos('.', _pos) <Bar>
	\ :unlet _pos <CR>
