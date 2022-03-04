" Ensure python3 is loaded before python2,
" since vim can not use both at the same time
if has('python3')
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                    vim-plug                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" Setting up Vundle - the vim plugin bundler
"let vundleIsSetup=1
"let vundle_readme=expand('~/.vim/bundle/Vundle.vim/README.md')

"" Clone Vundle manually if not present
"if !filereadable(vundle_readme)
"	echo "Installing Vundle.."
"	echo ""
"	silent !mkdir -p ~/.vim/bundle
"	silent !git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"	let vundleIsSetup=0
"endif

call plug#begin('~/.vim/plugged')
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              Installed Plugins                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if v:version >= 800
	Plug 'w0rp/ale' " Asyncronous Lint Engine
endif

let g:ale_disable_lsp = 1 "use coc for lsp
let g:ale_set_balloons = 1
let g:ale_echo_msg_format = '%linter%: "%s"'
let g:ale_loclist_msg_format = '%linter%: "%s"'

let g:ale_tex_chktex_options = '-I -n 18 -n 44'
let g:ale_go_golangci_lint_package = 1
let g:ale_java_google_java_format_executable = 'java'
let g:ale_java_google_java_format_options = '-jar /usr/local/bin/google-java-format-1.7-all-deps.jar -i'
let g:ale_python_pylint_executable = 'pylint3'
let g:ale_python_yapf_executable = 'yapf3'

"no longer needed
let g:ale_fixers = {
\	'go': [
\		'gofmt',
\		'goimports',
\	],
\	'html': [
\		'prettier',
\	],
\	'java': [
\		'google_java_format',
\	],
\	'javascript': [
\		'eslint',
\	],
\	'perl': [
\		'perltidy',
\	],
\	'python': [
\		'yapf',
\		'trim_whitespace',
\	],
\	'svelte': [
\		'eslint',
\		'prettier',
\		'prettier_standard',
\	],
\	'xml': [
\		'xmllint',
\	],
\}

let g:ale_linter_aliases = {'svelte': ['css', 'javascript']}
let g:ale_linters = {
\	'cpp': [
\		'ccls',
\	],
\	'c': [
\		'ccls',
\	],
\	'go': [
\		'gofmt',
\		'golint',
\		'go vet',
\		'golangci-lint',
\	],
\	'python': [
\		'pylint',
\	],
\	'svelte': [
\		'stylelint',
\		'eslint',
\	],
\}

let g:ale_go_gofmt_options = '-s'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
"coc.nvim works best on vim >= 8.1.1719
let g:coc_disable_startup_warning = 1

	"coc.nvim works best on vim >= 8.1.1719
	let g:coc_disable_startup_warning = 1
	" configure coc-install targets
	let g:coc_global_extensions = []
	let g:coc_global_extensions += ['coc-json']
	let g:coc_global_extensions += ['coc-pydocstring']
	let g:coc_global_extensions += ['coc-pyright']
	let g:coc_global_extensions += ['coc-sh']
	let g:coc_global_extensions += ['coc-tabnine']
	let g:coc_global_extensions += ['coc-tsserver']
	let g:coc_global_extensions += ['coc-svelte']
	let g:coc_global_extensions += ['coc-vimlsp']

Plug 'evanleck/vim-svelte' " svelte indentation/hightlighting.
let g:svelte_preprocessors = ['typescript']
Plug 'pangloss/vim-javascript' " JS indentation/hightlighting.
Plug 'HerringtonDarkholme/yats.vim' " Typescript hightlighting

Plug 'preservim/nerdtree' " File explorer
let NERDTreeShowHidden=1
Plug 'Xuyuanp/nerdtree-git-plugin' " Git status extension

Plug 'tpope/vim-fugitive' " Git wrapper
Plug 'tpope/vim-surround' " Pair braces
Plug 'tpope/vim-unimpaired' " Add some usefull mappings with '[' and ']'
Plug 'tpope/vim-abolish' " Convert MixedCase/camelCase/snake_case
Plug 'tpope/vim-repeat' " Repeat plugin mappings

Plug 'altercation/vim-colors-solarized' " Colorscheme

Plug 'vim-airline/vim-airline' " Neat Status Line
Plug 'vim-airline/vim-airline-themes'

Plug 'aserebryakov/vim-todo-lists' " ToDo List

" Add all Plugins before this
call plug#end()

"" Install plugins after fresh start
"if vundleIsSetup == 0
"	echo "Installing Vundles, please ignore key map error messages"
"	echo ""
"	:PluginInstall
"endif


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

""""""""" Maybe needed for coc.."""""""""""
" TextEdit might fail if hidden is not set.
set hidden
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
" Give more space for displaying messages.
set cmdheight=2
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif
"""""""""""""""""""""""""""""""""""""""""""


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
" Size of real Tabs
set tabstop=8

set noexpandtab
" Indent amount when using cindent, >>, ..
set shiftwidth=8
" Indent amount when using TAB
set softtabstop=8
" cindent (i have no idea what these lines actually mean)
set cindent
set cinoptions=:0,l1,t0,g0,0 fo=tcqlron

"sgd-version
set shiftwidth=4
set softtabstop=4

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
colorscheme solarized
" set if terminal colors are not set
"let g:solarized_termcolors=256
let g:airline_solarized_bg='light'
let g:airline_theme='solarized'

function! Airline_solar_adjust()
	if &background == 'light'
		let g:airline_solarized_bg='light'
	else
		let g:airline_solarized_bg='dark'
	endif
	if exists(':AirlineRefresh')
	    " Only use AirlineRefresh if loaded already
	    AirlineRefresh
	    " Clear & redraw the screen, then redraw all statuslines.
	    redraw!
	    redrawstatus!
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
	call Custom_hi()
endfunction

" Call this because ToggleBG is not loaded otherwise
" (see https://github.com/altercation/vim-colors-solarized/issues/40)
call togglebg#map("")
" Also refresh custom hi after the toggle
call Refresh_custom_hi()

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

" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Use tab for trigger completion with characters ahead and navigate. (coc)
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

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

" Use ALEfix to format current file
"noremap <leader>F :ALEFix<cr>

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
xmap <leader>F  :call CocAction('format')<cr>
nmap <leader>F  :call CocAction('format')<cr>

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges. XXX doesnt work?
" Requires 'textDocument/selectionRange' support of language server.
"nmap <silent> <C-s> <Plug>(coc-range-select)
"xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support. XXX TODO
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" Toggle light/dark theme
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

autocmd FileType sls setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType javascript setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType javascriptreact setlocal ts=2 sts=2 sw=2 expandtab
