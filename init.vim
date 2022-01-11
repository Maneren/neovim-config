set title
set number

set tabstop=2
set shiftwidth=2
set expandtab

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Text editing support
Plug 'tpope/vim-fugitive' " Support to git commands
Plug 'christoomey/vim-tmux-navigator' " Navigation between windows
Plug 'scrooloose/nerdtree' " Navigation between files
Plug 'haya14busa/incsearch.vim' " Better way to look for words
Plug 'morhetz/gruvbox', { 'as': 'gruvbox' } " Nvim theme
Plug 'vim-airline/vim-airline' " Bar theme
Plug 'junegunn/vim-easy-align'
Plug 'https://github.com/junegunn/vim-github-dashboard.git'
Plug 'honza/vim-snippets'
Plug 'ervandew/supertab'
Plug 'Chiel92/vim-autoformat'

" Initialize plugin system
call plug#end()

" rustfmt on write using autoformat
autocmd BufWrite * :Autoformat

" --------------------------------------------------------
" COC-VIM TAB SETTINGS START

" Use tab for trigger completion with characters ahead and navigate.

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

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.

if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

