"""""""""""""""""""""""""""""""
"                             "
"        Basic Setup          "
"                             "
"""""""""""""""""""""""""""""""

set nocompatible              " be iMproved, required
filetype off                  " required
" set clipboard=unnamed         " use mac clipboard"

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"execute pathogen#infect()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                                             "
" => Plugins                                                                  "
"                                                                             "
"Bundle 'gmarik/vundle'                    "Plugin Manager                    "
"Bundle 'vim-scripts/L9'                   "VIMScript Programming Libraries   "
"Bundle 'fholgado/minibufexpl.vim'         "List your buffers                 "
"Bundle 'scrooloose/nerdtree'              "File Manager                      "
"Bundle 'scrooloose/syntastic'             "Static Analysis                   "
"Bundle 'wincent/Command-T'                "Fuzzy File Finder                 "
"Bundle 'altercation/vim-colors-solarized' "Color Scheme                      "
"Bundle 'vim-scripts/vcscommand.vim'       "Source Control tools              "
"Bundle 'tpope/vim-fugitive'               "GIT Specific tools                "
"Bundle 'nvie/vim-togglemouse'             "Yes I still use the mouse         "
"Bundle 'Raimondi/delimitMate'             "Go to the closing character / tag "
"Bundle 'Lokaltog/vim-powerline.git'       "Better Status Line                "
"Bundle 'jnwhiteh/vim-golang.git'          "GO Lang support                   "
"Bundle 'ervandew/supertab'                "Tab Autocomplete                  "
"Bundle 'msanders/snipmate.vim'            "Snippet Expand                    "
"Bundle 'JSON.vim'                         "JSON Code highlight               "
"Bundle 'lukaszb/vim-web-indent'           "Better js and html auto indent    "
"                                                                             "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" My Bundles here:
Bundle 'tpope/vim-rails'
Bundle 'klen/python-mode'
Bundle 'Valloric/YouCompleteMe'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Bundle 'tpope/vim-endwise'
Bundle 'sickill/vim-pasta'
Bundle 'tpope/vim-surround'
Bundle 'xenoterracide/css.vim'
Bundle 'vim-scripts/L9'
Bundle 'fholgado/minibufexpl.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'wincent/Command-T'
Bundle 'altercation/vim-colors-solarized'
Bundle 'vim-scripts/vcscommand.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'nvie/vim-togglemouse'
Bundle 'Raimondi/delimitMate'
Bundle 'Lokaltog/vim-powerline.git'
Bundle 'jnwhiteh/vim-golang.git'
Bundle 'msanders/snipmate.vim'
Bundle 'JSON.vim'
Bundle 'lukaszb/vim-web-indent'
Bundle 'mattn/emmet-vim'
Bundle 'kien/ctrlp.vim'
Plugin 'mileszs/ack.vim'
Plugin 'othree/yajs.vim'

Plugin 'gmarik/Vundle.vim'

call vundle#end()            " required
filetype plugin indent on    " required

"""""""""""""""""""""""""""""""
"                             "
"      Custom Functions       "
"                             "
"""""""""""""""""""""""""""""""

"Clean trailing whitespace on save
fun! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun

"Format JSON
fun! PrettyJSON()
  :%!python -m simplejson.tool
  set filetype=json
endfun

"""""""""""""""""""""""""""""""
"                             "
"         Appearance          "
"                             "
"""""""""""""""""""""""""""""""

"Color Scheme stuffs
set background=dark
let g:solarized_termtrans=2
let g:solarized_contrast="high"
let g:solarized_visibility="high"
let g:solarized_termcolors=256
colorscheme solarized

set ruler        "Always show current position
set cul          "highlight current line
set hlsearch     "highlight search
set cmdheight=2  "The commandbar height
set number       "show line numbers
set nohidden     "dont unload my buffer
set nolazyredraw "Don't redraw while executing macros
set showmatch    "Show matching bracets when text indicator is over them
set laststatus=2 "always have a status bar
set showcmd      "show information about the current command
syntax enable    "Enable syntax hl

highlight Pmenu ctermbg=8 guibg=#606060
highlight PmenuSel ctermbg=1 guifg=#dddd00 guibg=#1f82cd
highlight PmenuSbar ctermbg=0 guibg=#d6d6d6

"""""""""""""""""""""""""""""""
"                             "
"          MISC VIM           "
"                             "
"""""""""""""""""""""""""""""""

set history=700                             "Sets how many lines of history VIM has to remember
set ttimeoutlen=50                          "Speed up O etc in the Terminal
set autoread                                "Set to auto read when a file is changed from the outside
set bs=2                                    "allow backspace
set scrolloff=6                             "start scrolling 5 lines before edge of viewport
set pastetoggle=<f10>                       "Better paste behavior
autocmd! bufwritepost vimrc source ~/.vimrc "When vimrc is edited, reload it

"Search Options
set ignorecase "Ignore case when searching
set incsearch  "Make search act like search in modern browsers
set magic      "Set magic on, for regular expressions

"Enable filetype plugin
filetype plugin on
filetype indent on
filetype on
syntax enable

"Turn backup off
set nobackup
set nowb
set noswapfile

"Stop beeping at me bro
set noerrorbells
set vb
set t_vb="."

"Enable mouse support in xterm
set mouse=a
set ttymouse=xterm2

"Load Project specific .vimrc
set exrc   "enable per-directory .vimrc files
set secure "disable unsafe commands in local .vimrc files

"""""""""""""""""""""""""""""""
"                             "
"     Spacing and Lines       "
"                             "
"""""""""""""""""""""""""""""""

set autoindent "auto indent the next line

"Tabs
"if $WORK
  set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
"else
"  set tabstop=4 softtabstop=2 shiftwidth=4 expandtab
"endif

"Line Wrapping
set tw=500 "Max text width
set ai     "Auto indent
set si     "Smart indet
set wrap   "Wrap lines

"""""""""""""""""""""""""""""""
"                             "
"         Leader Key          "
"                             "
"""""""""""""""""""""""""""""""

"close buffer
nnoremap <leader>q :bw <cr>
"toggle nerdtree
nnoremap <leader>n :NERDTreeToggle<cr>
"Nice File Diff
nnoremap <leader>d :VCSVimDiff <cr>
"Commit Changes
nnoremap <leader>c :VCSCommit <cr>
"GIT Status
nnoremap <leader>s :Gstatus <cr>
"Delete all buffers
nnoremap <leader>da :bufdo silent! bdelete<cr>
"CtrlP window
nnoremap <leader>t :CtrlP<cr>

"Change Tab Spacing
"nnoremap <leader>2 <esc>:set expandtab tabstop=2 softtabstop=2 shiftwidth=2<cr>
"nnoremap <leader>4 <esc>:set expandtab tabstop=4 softtabstop=4 shiftwidth=4<cr>
"nnoremap <leader>8 <esc>:set expandtab tabstop=8 softtabstop=8 shiftwidth=8<cr>
"
"""""""""""""""""""""""""""""""
"                             "
"      Remap Commands         "
"                             "
"""""""""""""""""""""""""""""""

:command! W w "just write the file!

"""""""""""""""""""""""""""""""
"                             "
"          Language           "
"                             "
"""""""""""""""""""""""""""""""

" => CSS
autocmd FileType css set sw=2
autocmd FileType css set ts=2
autocmd FileType css set sts=2
autocmd FileType css set textwidth=79
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS

" => HTML
autocmd FileType html set sw=2
autocmd FileType html set ts=2
autocmd FileType html set sts=2
autocmd FileType html set textwidth=0
autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags

" => JavaScript
au FileType javascript setl fen
au FileType javascript setl nocindent
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType javascript autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
autocmd FileType javascript set sw=2
autocmd FileType javascript set ts=2
autocmd FileType javascript set sts=2
autocmd FileType javascript set textwidth=79

" => Markdown
au BufNewFile,BufRead *.md set filetype=markdown
autocmd FileType markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType markdown set sw=2
autocmd FileType markdown set ts=2
autocmd FileType markdown set sts=2
autocmd FileType markdown set textwidth=79

" => JSON
au BufNewFile,BufRead *.json set filetype=json
:command! PrettyJSON :call PrettyJSON()

" => GO Lang
set rtp+=$GOROOT/misc/vim

"""""""""""""""""""""""""""""""
"                             "
"       Plugin Config         "
"                             "
"""""""""""""""""""""""""""""""

" => scrooloose/syntastic
let g:syntastic_enable_signs=1
let g:syntastic_error_symbol="✗"
let g:syntastic_warning_symbol="⚠"
let g:syntastic_enable_balloons = 1
let g:syntastic_enable_highlighting = 1

" => fholgado/minibufexpl.vim
let g:miniBufExplCloseOnSelect = 0
let g:miniBufExplModSelTarget = 1

" => msanders/snipmate.vim
let g:snippets_dir=$HOME."/environment/snippets"
let g:snips_trigger_key = '<C-tab>'

" => wincent/Command-T
let g:CommandTMatchWindowAtTop = 1

"get escape to work in the terminal for closing the command-t window
if &term =~ "xterm" || &term =~ "screen"
  let g:CommandTCancelMap     = ['<ESC>', '<C-c>']
  let g:CommandTSelectNextMap = ['<C-n>', '<C-j>', '<ESC>OB']
  let g:CommandTSelectPrevMap = ['<C-p>', '<C-k>', '<ESC>OA']
endif

" => Lokaltog/vim-powerline.git
let g:Powerline_symbols = 'unicode'
let g:Powerline_stl_path_style = 'short'


" => kien/ctrlp.vim
let g:ctrlp_cmd = 'CtrlP'

"show window at top of screen
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_max_files = 0
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" Python-mode
" Activate rope
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator
" modes)
" " [M            Jump on previous class or method (normal, visual, operator
" modes)
" " ]M            Jump on next class or method (normal, visual, operator
" modes)
" let g:pymode_rope = 1
let g:pymode_rope = 0 
let g:pymode_rope_lookup_project = 0 
let g:pymode_rope_complete_on_dot = 0 

" " Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pep8"
let g:pymode_lint_options_pep8 = 
    \ {'max_line_length': 120 }
let g:pymode_options_colorcolumn = 120
autocmd FileType python set colorcolumn=120

" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0

" Skip .pyc files in NERDTree
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" YouCompleteMe customizations
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Add virtualenv suport for YCM
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF
