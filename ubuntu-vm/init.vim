" Enable mouse in all modes
set mouse=a
let mapleader=" "


"; as :
nnoremap ; :

" Ctrl+k as Esc
nnoremap <C-k> <Esc>
inoremap <C-k> <Esc>
vnoremap <C-k> <Esc>
snoremap <C-k> <Esc>
xnoremap <C-k> <Esc>
cnoremap <C-k> <C-c>
onoremap <C-k> <Esc>
lnoremap <C-k> <Esc>
tnoremap <C-k> <Esc>

" No arrow keys --- force yourself to use the home row
"nnoremap <up> <nop>
"nnoremap <down> <nop>
"inoremap <up> <nop>
"inoremap <down> <nop>
"inoremap <left> <nop>
"inoremap <right> <nop>

" Permanent undo
set undodir=~/.vimdid
set undofile

set relativenumber " Relative line numbers
set ttyfast


" I can type :help on my own, thanks.
map <F1> <Esc>
imap <F1> <Esc>

nnoremap qq :qa<CR>
"Allow yanking to System Clipboard with +y
set clipboard+=unnamedplus

"mapping for fzf
"search for the tags in the current buffer
nmap <Leader>t :BTags<CR>
"search for the tags accross Projects
nmap <Leader>T :Tags<CR>
nmap <Leader>fg :GFiles<CR>
nmap <Leader>f :Files<CR>
nmap <Leader>b :Buffers<CR>
nmap <Leader>h :History<CR>

nnoremap tr :tabr<CR>
nnoremap tl :tabl<CR>
nnoremap tp :tabp<CR>
nnoremap tn :tabn<CR>

nmap nt :NERDTreeToggle<CR>
nmap tt <c-w><c-w>
imap jj <esc>
set number
" PATHOGEN
"
call plug#begin('~/.config/nvim/plugged')


"Linting Engine
Plug 'dense-analysis/ale'

"Hightly the tree
Plug 'ryanoasis/vim-devicons'
"Plug 'tiagofumo/vim-nerdtree-syntax-highlight'


" General/Editing
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"Solidity
Plug 'tomlion/vim-solidity'
Plug 'scrooloose/nerdcommenter'

" URLs
Plug 'tyru/open-browser.vim'
Plug 'tyru/open-browser-github.vim'


" Misc Languages/Syntax
Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'
"Plug 'racer-rust/vim-racer'
Plug 'LnL7/vim-nix'
Plug 'junegunn/fzf' " Multi-entry selection UI.
Plug 'junegunn/fzf.vim' " Multi-entry selection UI.

" HTML, CSS etc
Plug 'groenewege/vim-less'
Plug 'digitaltoad/vim-jade'
Plug 'mustache/vim-mustache-handlebars'
Plug 'mattn/emmet-vim'

" Haskell
Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }
Plug 'Twinside/vim-hoogle', { 'for': 'haskell' }
Plug 'pbrisbin/vim-syntax-shakespeare'
Plug 'ndmitchell/ghcid', { 'rtp': 'plugins/nvim' }
Plug 'autozimu/LanguageClient-neovim', { 'do' : ':UpdateRemotePlugins' }
" Javascript
Plug 'elzr/vim-json'
Plug 'moll/vim-node', { 'for': 'javascript' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'mxw/vim-jsx', { 'for': 'javascript' }
Plug 'othree/yajs.vim', { 'for': 'javascript' }

" Colors
Plug 'rakr/vim-one'
Plug 'morhetz/gruvbox'
Plug 'altercation/vim-colors-solarized'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'pbrisbin/vim-colors-off'
Plug 'owickstrom/vim-colors-paramount'

" Coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}


call plug#end()

for fpath in split(globpath('~/.config/nvim/config', '*.vim'), '\n')
  exe 'source' fpath
endfor

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Navigate snippet placeholders using tab
let g:coc_snippet_next = '<Tab>'
let g:coc_snippet_prev = '<S-Tab>'

" Use enter to accept snippet expansion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<CR>"

" Use NerdTree automatically on start of VIM
autocmd vimenter * NERDTree 


autocmd BufReadPost *.rs setlocal filetype=rust

let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ }

let g:LanguageClient_autoStart = 1



" Airline Configurations(Fancy thing at the bottom)
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='one'

"This is for the vim ale plugin
let g:ale_sign_column_alwaus = 1
" Prevent ale ffom conflicting with Coc Nvim
"let g:ale_disable_lsp = 1

let g:ale_completion_enabled = 1


let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'



syntax enable
set background=light
colorscheme slate
"let g:solarized_termcolors=16

hi Comment ctermfg=LightBlue
hi Terminal ctermbg=LightBlue ctermfg=blue guibg=LightBlue guifg=blue
hi LineNr ctermfg=grey



" Configure devicons
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable_airline_tabline = 1
"let g:webdevicons_enable_airline_statusline = 1

let g:WebDevIconsUnicodeDecorateFileNodes = 1


set encoding=UTF-8

