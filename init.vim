set sw=2
set title
set number

set tabstop=4
set shiftwidth=4
set expandtab

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
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ervandew/supertab'
Plug 'Chiel92/vim-autoformat'

" Initialize plugin system
call plug#end()

" rustfmt on write using autoformat
autocmd BufWrite * :Autoformat
