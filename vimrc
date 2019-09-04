""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                    Vundle                                    "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              Installed Plugins                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin 'ninjin/vim-openbsd' " Use Openbsd codestyle

Plugin 'VundleVim/Vundle.vim' " Let Vundle manage Vundle, required

if v:version >= 800
	Plugin 'ludovicchabant/vim-gutentags' " Regenerate Tag Files
	Plugin 'w0rp/ale' " Asyncronous Lint Engine (ALE)
endif

let g:ale_echo_msg_format = '%linter%: "%s"'
let g:ale_loclist_msg_format = '%linter%: "%s"'

let g:ale_tex_chktex_options = '-I -n 18 -n 44'
let g:ale_go_golangci_lint_package = 1
let g:ale_java_google_java_format_executable = 'java'
let g:ale_java_google_java_format_options = '-jar /usr/local/bin/google-java-format-1.7-all-deps.jar -i'

let g:ale_fixers = {
\	'go': [
\		'gofmt',
\		'goimports',
\	],
\	'java': [
\		'google_java_format',
\	],
\	'xml': [
\		'xmllint',
\	],
\	'html': [
\		'prettier',
\	],
\}

let g:ale_go_gofmt_options = '-s'

let g:ale_linters = {
\	'go': [
\		'gofmt',
\		'golint',
\		'go vet',
\		'golangci-lint',
\]}

if v:version >= 704 && (has('python') || has('python3'))
	Plugin 'SirVer/ultisnips' " Snippet engine
	Plugin 'honza/vim-snippets' " Actual snippets
endif

Plugin 'Valloric/YouCompleteMe' " Semantic Completion

Plugin 'chrissicool/cscope_maps' " Cscope from cludwig@
set tags=./tags;			" search tags files upwards
set csto=1				" prefer tags DBs over cscope DBs

Plugin 'taglist.vim' " Tags on sidebar
let Tlist_WinWidth = 50
let Tlist_Close_On_Select=1

Plugin 'tpope/vim-fugitive' " Git wrapper
Plugin 'tpope/vim-surround' " Pair braces
Plugin 'tpope/vim-repeat' " Repeat plugin mappings

Plugin 'altercation/vim-colors-solarized' " Colorscheme

Plugin 'vim-airline/vim-airline' " Neat Status Line
Plugin 'vim-airline/vim-airline-themes'

Plugin 'lervag/vimtex' " 'Modern' LaTeX support
" let g:tex_flavor='latex'
let g:vimtex_view_method="zathura"
let g:vimtex_compiler_latexmk = {
	\ 'background' : 1,
	\ 'build_dir' : '../obj',
	\ 'callback' : 1,
	\ 'continuous' : 1,
	\ 'executable' : 'latexmk',
	\ 'hooks' : [],
	\ 'options' : [
	\   '-verbose',
	\   '-file-line-error',
	\   '-synctex=1',
	\   '-interaction=nonstopmode',
	\ ],
	\}


" Plugin 'LaTeX-Box-Team/LaTeX-Box' " LaTeX support
" Plugin 'matze/vim-tex-fold' " Correct Folding like vim-latex
" let g:LatexBox_viewer="zathura"
" let g:LatexBox_latexmk_preview_continuously=1
" let g:LatexBox_quickfix=2
" let g:LatexBox_latexmk_options='-output-directory=../obj'
" let g:LatexBox_build_dir='../obj'



"Plugin 'vim-latex/vim-latex'
"let g:Tex_DefaultTargetFormat='pdf'
"let g:Tex_CompileRule_dvi='latex
"                               \ -output-directory=../obj
"                               \ $*'
"let g:Tex_ViewRuleComplete_dvi='xdvi ../obj/$* &'
"let g:Tex_CompileRule_pdf='latexmk
"                               \ -pdf
"                               \ -output-directory=../obj/
"                               \ $*'
"" let g:Tex_CompileRule_pdf='pdflatex
""                                \ -src-specials
""                                \ -output-directory ../obj
""                                \ $*'
"let g:Tex_ViewRuleComplete_pdf='xdg-open ../obj/$*.pdf &'

Plugin 'aserebryakov/vim-todo-lists' " ToDo List

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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              General settings                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


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

" Enable autocompletion line in commandline and behaviour
set wildmenu
set wildmode=longest:full,full

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
set softtabstop=8
" cindent (i have no idea what these lines actually mean)
set cindent
set cinoptions=:0,l1,t0,g0,0 fo=tcqlron

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

" Keep lines above or below cursor
set scrolloff=7

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

" Enable folding
set foldmethod=indent
set foldlevel=99

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
let g:solarized_termcolors=256
colorscheme solarized
let g:airline_theme='solarized'

function! Airline_solar_adjust()
	if &background == 'light'
		let g:airline_solarized_bg='light'
	else
		let g:airline_solarized_bg='dark'
	endif
endfunction

function! Custom_hi()
	" Highlight column 81
	set colorcolumn=81

	hi OverLength ctermbg=red guibg=red
	match OverLength /\%>80v.\+/
	hi TrailingWhitespace ctermbg=red guibg=red
	match TrailingWhitespace /\s\+$/
	hi clear SpellBad
	hi SpellBad cterm=underline
endfunction

function! Refresh_custom_hi()
	call Airline_solar_adjust()
	AirlineRefresh
	call Custom_hi()
endfunction

call Custom_hi()

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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   Mappings                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" change <Leader> key
let mapleader=","
let maplocalleader=","

" UltiSnips
let g:UltiSnipsExpandTrigger="<c-b>"
let g:UltiSnipsListSnippets="<c-l>"

"YouCompleteMe
imap <Tab> <C-P>

" Split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding with the spacebar
nnoremap <space> za

" Courser at bottom
vnoremap y y`]
" Courser at last position
" vmap y ygv<Esc>

" Open definition in new tab
" noremap <C-\> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" ctags shortcut might be usefull
" map <F> :!/usr/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" Use ALEfix to format current file
noremap <leader>f :ALEFix<cr>

" Toggle TagList-window
noremap <leader>l :TlistToggle<cr><C-w>10h

" Toggle light/dark theme
call togglebg#map("")
noremap <silent> <leader>c :ToggleBG<cr>
	\ :execute 'call Refresh_custom_hi()'<cr>

" Remove trailing whitespace, dont highlight while searching and restore
" search-register and cursor position afterwards.
noremap <silent> <leader>w :let _pos = getcurpos() <Bar>
	\ :let _s=@/ <Bar>
	\ :%s/\s\+$//e <Bar>
	\ :let @/=_s <Bar>
	\ :nohl <Bar>
	\ :unlet _s <Bar>
	\ :call setpos('.', _pos) <Bar>
	\ :unlet _pos <CR>
