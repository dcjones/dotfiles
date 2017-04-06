
"let g:python_host_prog='/usr/local/bin/python'

call plug#begin('~/.config/nvim/plugged')

Plug 'AlessandroYorba/Despacio'
Plug 'Aluriak/nerdcommenter'
Plug 'JuliaLang/julia-vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'Raimondi/delimitMate'
Plug 'Shougo/deoplete.nvim'
Plug 'airblade/vim-gitgutter'
Plug 'bfredl/nvim-ipy'
Plug 'bronson/vim-trailing-whitespace'
Plug 'cespare/vim-toml'
Plug 'chrisbra/csv.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'cocopon/iceberg.vim'
Plug 'dcjones/vim-mk'
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch.vim'
"Plug 'idbrii/vim-mark'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install'  }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'junegunn/seoul256.vim'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'ludovicchabant/vim-gutentags'
Plug 'maverickg/stan.vim'
Plug 'mhartington/oceanic-next'
Plug 'morhetz/gruvbox'
Plug 'rust-lang/rust.vim'
Plug 'terryma/vim-expand-region'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-tbone'
Plug 'vim-airline/vim-airline'
Plug 'vim-scripts/bufexplorer.zip'
Plug 'w0ng/vim-hybrid'
Plug 'wellle/targets.vim'
call plug#end()

" The standard stuff
set nocompatible
set encoding=utf-8
set ffs=unix,dos,mac
set modelines=0
set autoindent
set cino=(0
set smartindent
set history=300
set autoread
set autowrite
set so=7
set hlsearch
set incsearch
set gdefault
set ttyfast
set number
set ruler
set hidden
set cursorline
set noerrorbells
set novisualbell
set wrapmargin=80
set textwidth=80
set colorcolumn=80
set showbreak=↪
set fillchars=diff:⣿
set splitright
set splitbelow
set wildmode=full
set t_Co=256
set shiftwidth=4
set tabstop=4
set expandtab
set autochdir
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set nolazyredraw
set backspace=2
set backupdir=~/.local/share/nvim/swap
set noshowcmd


" Maybe fix #2093
set nottimeout

syntax on
filetype plugin on
filetype indent on
set completeopt-=preview

" Fucking bells
autocmd! GUIEnter * set vb t_vb=
set noerrorbells
set novisualbell
set t_vb=

" Leader
let mapleader = "\<space>"

colorscheme gruvbox
set background=dark

" work around nvim issue. The gui_running option doesn't get set until
" after the vimrc is loaded. So we need to reload color scheme, etc, to get good
" colors.
"function! ReloadColors()
    "colorscheme iceberg
    ""hi Normal ctermbg=none
    ""hi Normal guibg=none
    "AirlineRefresh
"endfunction
"command ReloadColors call ReloadColors()
"autocmd VimEnter * ReloadColors
"nmap <leader>c :ReloadColors<cr>


" Prevent myself from accidentally incrementing/decrementing numbers. Seriously,
" fuck this 'feature'.
nnoremap <C-a> <Nop>
nnoremap <C-x> <Nop>

" Fuck off, Ex mode
map Q <Nop>

" Fast saving and quiting
nmap <leader>w :w!<cr>
nmap <leader>W :wq!<cr>
nmap <leader>q :q!<cr>

" Some real dangerous shit
nmap <leader>e :edit!<cr>

" Escape from terminal mode
tnoremap <Esc> <C-\><C-n>

" region expansion
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" Save when losing focus
au FocusLost * :silent! wall

" Resize splits when the window is resized
au VimResized * :wincmd =

" tmux fix
nnoremap <silent> <BS> :TmuxNavigateLeft<cr>

" Copying text to the system clipboard.
"
" For some reason Vim no longer wants to talk to the OS X pasteboard through "*.
" Computers are bullshit.
"function! g:FuckingCopyTheTextPlease()
    "let old_z = @z
    "normal! gv"zy
    "call system('xclip -selection clip-board', @z)
    "let @z = old_z
"endfunction
"noremap <leader>p :silent! set paste<CR>"*p:set nopaste<CR>
"" noremap <leader>p mz:r!pbpaste<cr>`z
"vnoremap <leader>y :<c-u>call g:FuckingCopyTheTextPlease()<cr>

" Actually, just always use the clipboard
set clipboard+=unnamedplus



" Slime
let g:slime_target = "tmux"

" Easier to type, and I never use the default behavior.
noremap H ^
noremap L $
vnoremap L g_

" keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" EasyMotion
map . <Plug>(easymotion-prefix)
let g:EasyMotion_smartcase = 1
let g:EasyMotion_special_select_phrase = 0
let g:EasyMotion_special_select_line = 0
let g:EasyMotion_keys = 'aoeui;qjkx,.pyfgcrlbmwvz-snthd' " dvoraky
let g:EasyMotion_enter_jump_first = 1
"let g:EasyMotion_space_jump_first = 1

nmap s <Plug>(easymotion-s)
"map  / <Plug>(easymotion-sn)
"omap / <Plug>(easymotion-tn)
"map  n <Plug>(easymotion-next)
"map  N <Plug>(easymotion-prev)
map <leader><space> <Plug>(easymotion-bd-w)

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" Tbone
map <silent> <CR> :Twrite last<CR>

" DelimitMate
let delimitMate_expand_cr = 1
let delimitMate_balance_matchpairs = 1

" YCM
"let g:ycm_seed_identifiers_with_syntax = 1
"let g:ycm_complete_in_strings = 0

" Deoplete
let g:deoplete#enable_at_startup = 1
if has("patch-7.4.314")
    set shortmess+=c
endif

" Exit insert mode
inoremap jk <esc>

" Ctrl-backspace deletes words
imap <C-BS> <C-W>

" OSX-like tab controls
map <D-1> 1gt
map <D-2> 2gt
map <D-3> 3gt
map <D-4> 4gt
map <D-5> 5gt
map <D-6> 6gt
map <D-7> 7gt
map <D-8> 8gt
map <D-9> 9gt
map <D-t> :tabnew<CR>
map <D-w> :tabclose<CR>

" Ignore some common non-source files.
set wildignore+=*.so,*.o,*.a,*.lo,*.la,*.lai,*.Plo,*.dylib

" CtrlP
"map <silent> <C-b> :CtrlPBuffer<CR>
"map <silent> <C-m> :CtrlPMRUFiles<CR>
"map <silent> <C-g> :CtrlPFunky<CR>
"let g:ctrlp_user_command = ['.git/', 'git ls-files --cached --others  --exclude-standard %s']

" FZF
function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! s:bufopen(e)
  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

command! FZFBuffer call fzf#run({
    \'source':  reverse(<sid>buflist()),
    \'sink':    function('<sid>bufopen'),
    \'options': '+m',
    \'down':    len(<sid>buflist()) + 2
    \})

function! FZFGit()
    " Remove trailing new line to make it work with tmux splits
    let directory = substitute(system('git rev-parse --show-toplevel'), '\n$', '', '')
    if !v:shell_error
        lcd `=directory`
        call fzf#run({
            \ 'sink': 'edit',
            \ 'dir': directory,
            \ 'source': 'git ls-files',
            \ 'left': 60
            \ })
    else
        FZF
    endif
endfunction
command! FZFGit call FZFGit()

function! FZFMru()
    call fzf#run({
        \ 'source':   v:oldfiles,
        \ 'sink' :   'edit',
        \ 'options': '-m --no-sort',
        \ 'left':    60
        \ })
endfunction
command! FZFMru call FZFMru()


command! -nargs=1 FZFAg call fzf#run({
            \'source': Arghandler(<f-args>),
            \'sink' : function('AgHandler'),
            \'options' : '-m'
            \})

function! AgHandler(l)
    let keys = split(a:l,':')
    execute 'tabe +' . keys[-2] . ' ' . escape(keys[-1], ' ')
endfunction

function! Arghandler(l)
    return "ag " . a:l . " | sed 's@\\(.[^:]*\\):\\(.[^:]*\\):\\(.*\\)@\\3:\\2:\\1@' "
endfunction


nnoremap <silent> <C-p> :FZFGit<cr>
nnoremap <silent> <C-t> :FZFMru<cr>
nnoremap <silent> <C-b> :FZFBuffer<cr>
nnoremap <silent> <C-f> :Tags<cr>
nnoremap <silent> <C-F> :BTags<cr>
"nnoremap <C-f> :FZFAg 
"nnoremap <C-f> :FZFAg 
"
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)
nnoremap <C-s> :Ag! 

"call esearch#map('<C-s>', 'esearch')
"call esearch#map('<C-S>', 'esearch-word-under-cursor')

""
"let g:esearch = {
  "\ 'adapter':    'ag',
  "\ 'backend':    'nvim',
  "\ 'out':        'win',
  "\ 'batch_size': 1000,
  "\ 'use':        ['visual', 'hlsearch', 'last'],
  "\}


" Goyo
map <silent> <leader>g :Goyo<CR>

" Rainbow Parentheses
autocmd VimEnter * RainbowParentheses

" Unhighlighting search results
nnoremap <leader>c :noh<cr>

" BufExplorer
noremap <silent> <leader>Bv :BufExplorerVerticalSplit<CR>
noremap <silent> <leader>Bs :BufExplorerHorizontalSplit<CR>
noremap <silent> <leader>b :BufExplorer<CR>

" Harttime, for when I'm feeling like I hate myself.
"let g:hardtime_default_on = 1

" Fancy powerline status line
set laststatus=2
let g:airline_powerline_fonts=1
let g:airline_theme='gruvbox'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" Spelling
map <leader>s :setlocal spell! spelllang=en_us<CR>

" Match brackets
set showmatch

" Jump between brackets, etc
nnoremap <tab> %
vnoremap <tab> %

" Turn off gvim things
set guioptions-=T " no toolbar
set guioptions-=m " no menubar
set guioptions-=R " no right scrollbar
set guioptions-=r
set guioptions-=L " no left scrollbar
set guioptions-=l
set guioptions+=c " console dialogs

" Enable mouse
set nomousefocus
set mouse=a

" Run the current file
nnoremap <leader><cr> :!./%<cr>

" Use the arrows to something useful
map <right> :bn<cr>
map <left> :bp<cr>

" Python
let python_highlight_all = 1

" Haskell
let hs_highlight_delimiters = 1
let hs_highlight_boolean = 1
let hs_highlight_types = 1
let hs_highlight_more_types = 1
let hs_highlight_debug = 1

" Use space to fold unfold
fun! ToggleFold()
    if foldlevel('.') == 0
        normal! l
    else
        if foldclosed('.') < 0
            . foldclose
        else
            . foldopen
        endif
    endif
    " Clear status line
    echo
endfun

" noremap <space> :call ToggleFold()<CR>

" Turn off dumb indentation of html files.
autocmd BufEnter *.html setlocal indentexpr= 
autocmd BufEnter *.htm setlocal indentexpr= 
autocmd BufEnter *.xml setlocal indentexpr= 
autocmd BufEnter *.xsd setlocal indentexpr=

" .R files are R code, not REXX
augroup R
    autocmd BufNewFile,BufRead *.R set ft=r
augroup END

" Detect stan files
autocmd BufNewFile,BufRead *.stan,*.STAN, setf stan

" Treat ragel files as julia files
autocmd BufNewFile,BufRead *.rl setf julia

" Using vim as the man page viewer
let $PAGER=''
