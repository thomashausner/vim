autocmd BufWinEnter * silent loadview 
set confirm
set titlestring=%t
set title
" set lines=30 columns=80
set nocompatible
syntax enable
filetype plugin indent on
set autoindent
set expandtab
set hidden
set encoding=utf-8
set hlsearch
set incsearch
set ignorecase
set smartcase
set history=1000
set number
set relativenumber
set scrolloff=7
set wildmenu
set foldcolumn=1
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
filetype plugin indent on

set splitbelow
set splitright  
set nowrapscan

set undofile
set undodir=$HOME/vimundo/
set undolevels=1000

filetype plugin on
set omnifunc=syntaxcomplete#Complete

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

map <f2> :w<cr>
imap <f2> <esc>:w<cr>l
vmap <f2> <esc>:w<cr>

let mapleader=","

map <leader>s :setlocal spell!<cr>
map <leader>y "+y
map <leader>Y "*y

map <leader>p "+p
map <leader>P "*p

map <leader>q :q<cr>
map <leader>u :MundoToggle<cr>
map <leader>e :NERDTree<cr>
map <leader>t <C-w>v<C-w>l:term<cr>i
map <leader>w :mkview<cr>:w<cr>
map <leader>g :Git<cr>
map <leader>b :b<space> 
map <leader>d :bdel<cr>
map <leader>l :VimtexToggle<cr>

map <leader>lv :loadview<cr>
map <leader>mv :mkview<cr>

map <leader>vs :80 vsp<cr>
map <leader>n :tabnew<cr>

map <leader>md :setlocal filetype=markdown<cr>

imap -> <esc>:set dg<cr>a-<backspace>><esc>:set nodg<cr>a

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

map <F5> i<C-R>=strftime("%d.%m.%Y")<CR><Esc>
imap <F5> <C-R>=strftime("%d.%m.%Y")<CR><Esc>
map <F6> i<C-R>=strftime("%H:%M:%S")<CR><Esc>
imap <F6> <C-R>=strftime("%H:%M:%S")<CR><Esc>

tnoremap <Esc> <C-\><C-n>

call plug#begin()

Plug 'rakr/vim-one'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'mg979/vim-visual-multi' 
Plug 'dsummersl/gundo.vim'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/syntastic'
Plug 'alvan/vim-closetag'
Plug 'vimwiki/vimwiki'
Plug 'mattn/emmet-vim'
Plug 'lervag/vimtex'
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'reedes/vim-pencil'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
"Plug 'shougo/deoplete.nvim'
"Plug 'deoplete-plugins/deoplete-jedi'
"Plug 'zchee/deoplete-jedi'

call plug#end()

"=========== VIMWIKI 
"So it doesn't conflict with UltiSnips <tab>
nmap <leader><space> <Plug>VimwikiNextLink
nmap <leader>. <Plug>VimwikiPrevLink
" Conflict with the tab in source code: https://github.com/vimwiki/vimwiki/issues/357
let g:vimwiki_table_mappings = 0
 let g:vimwiki_list = [{'path': '~/vimwiki',
  \ 'syntax': 'markdown', 'ext': '.md'}]
  
let g:vimwiki_custom_wiki2html= $HOME.'/.config/nvim/plugged/vimwiki/autoload/vimwiki/customwiki2html.sh'
"=========== VIMWIKI END
"
"let g:deoplete#enable_at_startup = 1
"
let g:tex_flavor = 'latex'

let g:airline_theme='one'
colorscheme one
set background=dark

if (empty($TMUX))
  if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


" Plugin vim-closetag 
"
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
"
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'


" Plugin emmet
"
let g:user_emmet_leader_key=','
