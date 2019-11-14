"let g:mapleader=" " (Neo)Vim Configuration
" By Vilius Juodziukynas
" October 2019

" BASIC CONFIGURATION

set nocompatible
filetype plugin on
runtime macros/matchit.vim

" Remap Escape
inoremap jk <ESC>

" Remap the leader key to the spacebar
let mapleader = " "
"let g:mapleader=" "

" Run commands with semicolon
" nnoremap ; :

" Save the current buffer using the leader key
noremap <Leader>w :w<CR>

" Save and exit Vim using the leader key
noremap <Leader>e :wq<CR>

" Exit without saving using the leader key
noremap <Leader>q :q!<CR>

" Enable syntax highlighting
syntax on

" turn hybrid line numbers on
:set number relativenumber

"  Set the shell
set shell=/bin/zsh

" Clipboard functionality (paste from system)
vnoremap  <leader>y "+y
nnoremap  <leader>y "+y
nnoremap <leader>p "+p
vnoremap <leader>p "+p

" Look and feel

"" PLUGIN MANAGEMENT
packadd minpac
call minpac#init()

" Managed plugins (automatically installed and updated via "Pu" and "Pc")
call minpac#add('k-takata/minpac', {'type': 'opt'})
call minpac#add('vim-airline/vim-airline')
call minpac#add('vim-airline/vim-airline-themes')
call minpac#add('MarcWeber/vim-addon-mw-utils')
"call minpac#add('garbas/vim-snipmate')
call minpac#add('honza/vim-snippets')
call minpac#add('tpope/vim-repeat')
call minpac#add('phanviet/vim-monokai-pro')
call minpac#add('tpope/vim-surround')
call minpac#add('takac/vim-hardtime')
call minpac#add('wikitopian/hardmode')
call minpac#add('glacambre/firenvim')
call minpac#add('neoclide/coc.nvim')
" call minpac#add('tpope/vim-surround')
call minpac#add('mattn/emmet-vim')
call minpac#add('ctrlpvim/ctrlp.vim')
call minpac#add('easymotion/vim-easymotion')
" call minpac#add('bling/vim-airline')
call minpac#add('scrooloose/nerdtree')
call minpac#add('Xuyuanp/nerdtree-git-plugin')
call minpac#add('tpope/vim-fugitive')
call minpac#add('kassio/neoterm')
" for airline fonts call minpac#add('')
call minpac#add('vim-scripts/TTCoach')
call minpac#add('thanthese/Tortoise-Typing')
call minpac#add('pbrisbin/vim-mkdir')
call minpac#add('ervandew/supertab')
call minpac#add('tomtom/tcomment_vim')
call minpac#add('vim-scripts/zoom.vim')

command! Pu call minpac#update()
command! Pc call minpac#clean()

" Easymotion remap key
map <Leader> <Plug>(easymotion-prefix)
"" ADDITIONAL CONFIGURATION

" HARD-MODE
"" To enable it:
" :call HardMode()
"" To disable it:
" :call EasyMode()

" HARD-TIME
" let g:hardtime_default_on = 1

" Spelling
nnoremap <leader>sp :set spell<CR>
nnoremap <leader>s ]s
nnoremap <leader>f 1z=

" Line numbers
nnoremap <leader>n :set nonumber!<CR>
nnoremap <leader>rn :set norelativenumber!<CR>

" Clear highlighting
nnoremap <leader>c :nohl<CR>

" Paste mode
nnoremap <leader>pa :set nopaste!<CR>

" Pane navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Splits open at the bottom and right , which is non-retarded, unlike vim
" defaults
set splitbelow splitright

" Kill the arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>

" Normal Copy/paste behavior/shortcuts
vnoremap <C-c> "*y :let @+=@*<CR>
" map <C-v> "+p

" Visual Mode Orange Background, Black Text
hi Visual          guifg=#000000 guibg=#FD971F

" Default Colors for CursorLine
highlight CursorLine guibg=#3E3D32
highlight Cursor guibg=#A6E22E;

" Change Color when entering Insert Mode
autocmd InsertEnter * highlight  CursorLine guibg=#323D3E
autocmd InsertEnter * highlight  Cursor guibg=#00AAFF;

" Revert Color to default when leaving Insert Mode
autocmd InsertLeave * highlight  CursorLine guibg=#3E3D32
autocmd InsertLeave * highlight  Cursor guibg=#A6E22E;

" Set color Scheme
set termguicolors
colorscheme monokai_pro

" Easy expansion of the active file directory
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

"correct comment highlighting coc autocomplete
autocmd FileType json syntax match Comment +\/\/.\+$+

" Coc Configuration
  " Coc.nvim

" Better display for messages
set cmdheight=2
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes

" Use `lp` and `ln` for navigate diagnostics
nmap <silent> <leader>lp <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>ln <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> <leader>ld <Plug>(coc-definition)
nmap <silent> <leader>lt <Plug>(coc-type-definition)
nmap <silent> <leader>li <Plug>(coc-implementation)
nmap <silent> <leader>lf <Plug>(coc-references)

" Remap for rename current word
nmap <leader>lr <Plug>(coc-rename)

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" NERDTreeToggle hotkey
" nnoremap <silent> <C-k><C-B> :NERDTreeToggle<CR>
nnoremap <silent> <C-B> :NERDTreeToggle<CR>
" nnoremap <silent> <leader> :NERDTreeToggle<CR>
" If you want to open the nerdtree window when opening up Nvim,
" but put the cursor in the file-editing window,
" autocmd VimEnter * NERDTree | wincmd p

" Shortcut to edit THIS configuration file: (e)dit (c)onfiguration
nnoremap <silent> <leader>ec :e $MYVIMRC<CR>

" Shortcut to source (reload) THIS configuration file after editing it: (s)ource (c)onfiguraiton
nnoremap <silent> <leader>sc :source $MYVIMRC<CR>

" wildmenu
set wildoptions=pum
"It supports 'pumblend', don't worry.
set pumblend=20

"show buffer tabs
let g:airline#extensions#tabline#enabled = 1

" change airline theme
" let g:airline_molokai_bright=1
"
" let g:airline_theme='dark'
let g:airline_theme='molokai'
" let g:airline_powerline_fonts = 1

" remove trailing whitespace on save
autocmd BufWritePre *.* %s/\s\+$//e

let g:airline_powerline_fonts = 1

"" Keybinds for terminal
tnoremap <silent> <ESC> <C-\><C-n>

" fuzzyfind-like behaviour
set path+=**
set wildmenu
