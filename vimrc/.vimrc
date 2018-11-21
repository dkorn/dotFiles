" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Change leader to a comma because the backslash is too far away
" That means all \x commands turn into ,x
" The mapleader has to be set before vim-plug starts loading all
" the plugins.
let mapleader=","

" ============== key mappings  ==============

" Fzf search with arg or word under cursor
" prerequisite: brew install the_silver_searcher
nnoremap K :Ag <C-R><C-W><CR>:cw<CR>

" ========================================
" Vim plug configuration
" ========================================

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
" Easymotion: for easy motion on speed
Plug 'easymotion/vim-easymotion'
" Manipulate surrounding stuff ( ",',(,{,[ etc. )
Plug 'tpope/vim-surround'
" Ruby:
Plug 'vim-ruby/vim-ruby'
" ctrlp:
Plug 'ctrlpvim/ctrlp.vim'
" Tagbar:
Plug 'majutsushi/tagbar'
" Completion:
Plug 'Valloric/YouCompleteMe', { 'do' : '~/.vim/plugged/YouCompleteMe/install.py  --tern-completer' } "--gocode-completer
" RoR:
Plug 'tpope/vim-rails'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" GO:
Plug 'fatih/vim-go'
" vim-misc for easytags
Plug 'xolox/vim-misc'
" Easytags:
Plug 'xolox/vim-easytags'
" Abolish:
Plug 'tpope/vim-abolish'
" Endwise:
"Plug 'tpope/vim-endwise' " destroys tabs?
" Snippets Plug: ( + dependencies )
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
" Optional:
Plug 'honza/vim-snippets'
" Ansible:
Plug 'pearofducks/ansible-vim'
" Airline:
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Tern:
Plug 'ternjs/tern_for_vim'
" Javascript:
Plug 'pangloss/vim-javascript'
Plug 'jelera/vim-javascript-syntax'
Plug 'Raimondi/delimitMate'
Plug 'leafgarland/typescript-vim'
Plug 'posva/vim-vue'
" Scala:
Plug 'derekwyatt/vim-scala'
" Indent Guid:
Plug 'nathanaelkane/vim-indent-guides'
" SemanticHighlight:
Plug 'jaxbot/semantic-highlight.vim'
" Bufexplorer:
Plug 'jlanzarotta/bufexplorer'
" Colorschemes:
Plug 'flazz/vim-colorschemes'
" Enunch:
Plug 'tpope/vim-eunuch'
" Ale:
Plug 'w0rp/ale'
" Fzf:
Plug 'junegunn/fzf'
" Editorconfig:
Plug 'editorconfig/editorconfig-vim'
" Solarized:
Plug 'lifepillar/vim-solarized8'
" Stylus:
Plug 'wavded/vim-stylus', { 'for': ['stylus', 'markdown'] }
" Pug:
Plug 'digitaltoad/vim-pug', { 'for' : ['jade', 'pug', 'markdown'] }
" Mustache:
Plug 'juvenn/mustache.vim', { 'for' : ['mustache', 'markdown'] }
" Node:
Plug 'moll/vim-node', { 'for' : ['javascript', 'json', 'markdown'] }
" Es6:
Plug 'isRuslan/vim-es6', { 'for' : ['javascript', 'json', 'markdown'] }
" NERDTree:
Plug 'scrooloose/nerdtree'
" NerdTree Commenter:
Plug 'scrooloose/nerdcommenter'
" JSON:
Plug 'elzr/vim-json'
" Whitespaces:
Plug 'ntpeters/vim-better-whitespace'
" Find and Replace
Plug 'dkprice/vim-easygrep'

call plug#end()

" ====================================================
" END OF PLUGINS
" ====================================================

" ============== General Plugin Configs ==============

" strip all trailing whitespace everytime you save the file for file types not in the default blacklist
autocmd BufEnter * if index(g:better_whitespace_filetypes_blacklist, &ft) < 0 | exec 'EnableStripWhitespaceOnSave' | endif

" ================ General Config ====================

set spell spelllang=en_us       " Switches on spell checking
set complete+=kspell            " Turn on word completion (CTRL-N or CTRL-P)
set number                      " Line numbers are good
set backspace=indent,eol,start  " Allow backspace in insert mode
set history=1000                " Store lots of :cmdline history
set showcmd                     " Show incomplete cmds down the bottom
set showmode                    " Show current mode down the bottom
set gcr=a:blinkon0              " Disable cursor blink
set visualbell                  " No sounds
set autoread                    " Reload files changed outside vim
set showmatch                   " Highlight matching brace
set ruler                       " Show row and column ruler information
set mouse=a                     " activate mouse

set hlsearch                    " Highlight all search results
set smartcase                   " Enable smart-case search
set ignorecase                  " Always case-insensitive
set incsearch                   " Searches for strings incrementally

set cpt=.,w,b,u,t,i             " completion by all buffers, included files, etc

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

"turn on syntax highlighting
syntax on


" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
" NOT WORKING: Didnt work when yanked right out of YADR
"silent !mkdir ~/.vim/backups > /dev/null 2>&1
"set undodir=~/.vim/backups
"set undofile
set undolevels=1000 " Number of undo levels

" ================ Indentation ======================

set autoindent    " Auto-indent new lines
set smartindent   " Enable smart-indent
set smarttab      " Enable smart-tabs
set shiftwidth=2  " Number of auto-indent spaces
set softtabstop=2 " Number of spaces per Tab
set tabstop=2
set expandtab     " Use spaces instead of tabs

set pastetoggle=<F2> " For pasting text without indentation

" Display tabs and trailing spaces visually
"set list listchars=tab:\ \ ,trail:Â·
set listchars=tab:✗\ ,trail:✗,extends:»,precedes:« " Unprintable chars mapping

set nowrap        " Don't wrap lines
set linebreak     " Wrap lines at convenient points
set showbreak=+++ " Wrap-broken line prefix
set textwidth=100 " Line wrap (number of cols)

" =============== enoodle ==========================

if &term =~ '^screen'         " Tmux ttymouse mode
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif

let g:yml_syntax_folding=1
au FileType yml setlocal foldmethod=syntax

" Tagbar
nmap <F8> :TagbarToggle<CR>
" auto focus on tagbar when it opens
let g:tagbar_autofocus = 1
let g:tagbar_type_css = {
    \ 'ctagstype' : 'Css',
    \ 'kinds'     : [
        \ 'c:classes',
        \ 's:selectors',
        \ 'i:identities'
    \ ]
    \ }

" Python:

" python with virtualenv support
py3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

" YouCompleteMe:
let g:ycm_autoclose_preview_window_after_completion = 1

" easytags
:set tags=./tags,.tags;
:let g:easytags_dynamic_files = 1


" ================ Completion =======================

set wildmode=list:longest
set wildmenu                 " Option menu on the lower bar above the command line for vim options; enable ctrl-n and ctrl-p to scroll thru matches

" ---------------- wildignore ------------------
""python
:set wildignore+=*.pyc,*.pyo
"c/cpp
:set wildignore+=*.o,*.obj
""editors
:set wildignore+=*.swp,*~
"java
:set wildignore+=*.class
""VCS
:set wildignore+=*/.git/*,*/.hg/*,*/.svn/*

" ================ Scrolling ========================

set scroll=0            " set Pg Up/Dn to half screen size
set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1


" Color theme (drawing from altercation/vim-colors-solarized Bundle)
set t_Co=256
syntax enable
set background=dark
colorscheme solarized
color solarized

" =============== NERDTree Mappins =====================
" Open Nerd Tree with Ctrl+n
map <C-n> :NERDTreeToggle<CR>

" Reveal current file in NERDTree with Ctrl+r
map <C-f> :NERDTreeFind<CR>

" Autoload NERDTree if no file specified

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Auto close NERDTree if no more files

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Show hidden files in NERDTree

let NERDTreeShowHidden=1

""==================== clipboard ==========================
" enable copy to clipboard - commented out

"if $TMUX == ''
    "set clipboard+=unnamed
"endif
set clipboard=unnamed
" copy to clipboard with Ctrl-C

"map <C-x> :!pbcopy<CR>
"vmap <C-c> :w !pbcopy<CR><CR>

" paste from clipboard with Ctrl-V

"set pastetoggle=<F10>
"inoremap <C-v> <F10><C-r>+<F10>

"==================== my plugin configs ===================

set statusline+=%#warningmsg#
set statusline+=%{ALEGetStatusLine()}
set statusline+=%*

" ====== Make tabs be addressable via Apple+1 or 2 or 3, etc
" Use numbers to pick the tab you want (like iTerm)
map <silent> <D-1> :tabn 1<cr>
map <silent> <D-2> :tabn 2<cr>
map <silent> <D-3> :tabn 3<cr>
map <silent> <D-4> :tabn 4<cr>
map <silent> <D-5> :tabn 5<cr>
map <silent> <D-6> :tabn 6<cr>
map <silent> <D-7> :tabn 7<cr>
map <silent> <D-8> :tabn 8<cr>
map <silent> <D-9> :tabn 9<cr>

" ===== Add some shortcuts for ctags
map <Leader>tt <esc>:TagbarToggle<cr>
" TODO later, get open tag in new tab working
" http://stackoverflow.com/questions/563616/vim-and-ctags-tips-and-tricks
" map <C-\>:tab split<CR>:exec("tag ".expand("<cword>"))<CR>
"map <A-]>:vsp <CR>:exec("tag ".expand("<cword>"))<CR>

let g:tern_show_argument_hints='on_hold'
let g:tern_map_keys=1

let g:ale_linters ={ 'javascript': ['eslint'] }
nmap <silent> <leader>ln :ALENextWrap<cr>
nmap <silent> <leader>lp :ALEPreviousWrap<cr>

imap <C-c> <CR><Esc>O
" Support for github flavored markdown
" via https://github.com/jtratner/vim-flavored-markdown
" with .md extensions
au BufNewFile,BufRead *.markdown,*.mdown,*.mkd,*.mkdn,*.mdwn,*.md  set ft=markdown

" ================= spell highlights =================

highlight clear SpellBad
highlight SpellBad cterm=underline,bold ctermbg=red
