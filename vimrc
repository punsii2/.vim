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

" Colorscheme
Plugin 'altercation/vim-colors-solarized'

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

" Enable syntax highlighting
syntax enable

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

" Highlight column 81
if exists("&colorcolumn")
    set colorcolumn=81
    hi ColorColumn ctermbg = 3*
endif

set laststatus=2 " status
set modified
set visualbell

" Representation of nvisible characters, if :set list
set listchars=tab:\>-,trail:.

" Show listchars
set list

" Saved history
set history=2048
set undolevels=2048

" +-----------------------------------------------------------------------+
" |  Search                                                               |
" +-----------------------------------------------------------------------+

" Highlight search
set hlsearch

" Ignore case
set ignorecase

" Match case if searchstring starts with uppercase
set smartcase

" Start incremental search on typing
set incsearch


""" text display

" Show information about current command
set showcmd

set autoread
set breakat=\
set linebreak
set showbreak=>>
set wrapmargin=2
behave xterm

""" Editing
set textwidth=80
set backspace=indent,eol,start "allow backspacing over everything

" Settings for perl.vim
let perl_want_scope_in_variables = 1
let perl_extended_vars = 1
let perl_want_scope_in_variables = 1

" +-----------------------------------------------------------------------+
" |  Syntaxhighlighting                                                   |
" +-----------------------------------------------------------------------+

" CLUDWIG:
" user interface {{{1
set background=dark			" dark background for dark UI theme
set nohlsearch				" do not highlight matches
set showmatch				" show matches briefly
set autoindent				" automatically indent on next line
set smartindent				" try to guess beginning of next line
set ruler				" status line in all windows
set number				" turn on line numbering
set cursorline				" highlight current line
set guioptions-=m			" remove menu bar
set guioptions-=T			" remove toolbar
set guioptions-=r			" remove right-hand scroll bar
set guioptions-=l			" remove left-hand scroll bar
set guioptions-=b			" remove bottom-hand scroll bar
hi Statement gui=NONE cterm=NONE term=NONE
hi Normal guifg=lightgrey guibg=Black ctermbg=Black
hi CursorLine cterm=NONE ctermfg=NONE ctermbg=Black guibg=Gray15
hi OverLength ctermbg=red guibg=red
match OverLength /\%81v.\+/
hi TrailingWhitespace ctermbg=red guibg=red
match TrailingWhitespace /\s\+$/
" }}}

" highlight extra whitespaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\v\s+$| +\ze\t|\S\zs\t+ +|^\s*( {8})+/

set noexpandtab

" Size of real Tabs
set tabstop=8

" Indent amount when using cindent, >>, ..
set shiftwidth=8

" Indent amount when using TAB
set softtabstop=4

" Use global clipboard
set clipboard=unnamedplus

" open a splitted window to the right
set splitright

" Plugin taglist
set tags=./tags;			" search tags files upwards
set csto=1				" prefer tags DBs over cscope DBs
let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_WinWidth = 50
let Tlist_Close_On_Select=1

" +-----------------------------------------------------------------------+
" |  Mappings                                                             |
" +-----------------------------------------------------------------------+
" open definition in new tab
map <C-\> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
" courser at bottom
vmap y y`]
" courser at last position
" vmap y ygv<Esc>
map <F3> :TlistToggle<cr><C-w>h
map <F4> :TlistToggle<cr>
map <F5> :!/usr/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
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
