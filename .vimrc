set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
Plugin 'ascenator/L9', {'name': 'newL9'}

Plugin 'leafgarland/typescript-vim'

Plugin 'MaxMEllon/vim-jsx-pretty'

Plugin 'vim-python/python-syntax'

Plugin 'eslint/eslint'

Plugin 'psf/black'

Plugin 'dense-analysis/ale'

Plugin 'tpope/vim-surround'

Plugin 'Raimondi/delimitMate'

Plugin 'hashivim/vim-terraform'

"Themes

Plugin 'morhetz/gruvbox'

Plugin 'sickill/vim-monokai'

Plugin 'dracula/vim'

Plugin 'sonph/onehalf', { 'rtp': 'vim' }

Plugin 'gosukiwi/vim-atom-dark'

Plugin 'jacoborus/tender.vim'

Plugin 'jparise/vim-graphql'

Plugin 'iamcco/markdown-preview.nvim'

Plugin 'github/copilot.vim'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
"
let g:ale_linters = {
\    '*': ['remove_trailing_lines', 'trim_whitespace'],
\    'javascript': ['eslint', 'tsserver'],
\    'typescript': ['eslint', 'tsserver'],
\    'javascriptreact': ['eslint', 'tsserver'],
\    'typescriptreact': ['eslint', 'tsserver'],
\    'python': ['flake8', 'pylsp', 'isort', 'mypy'],
\    'scss': ['stylelint'],
\    'json': ['prettier', 'jsonlint']
\}
let g:ale_fixers = {
\    '*': ['remove_trailing_lines', 'trim_whitespace'],
\    'javascript': ['eslint'],
\    'typescript': ['eslint'],
\    'json': ['prettier', 'eslint'],
\    'javascriptreact': ['eslint'],
\    'typescriptreact': ['eslint'],
\    'python': ['black', 'isort', 'autoflake'],
\    'scss': ['stylelint']
\}
let g:ale_fix_on_save = 1
let g:ale_set_signs = 1
let g:ale_set_highlights = 1
let g:ale_lint_delay = 50

set expandtab
set tabstop=2
set shiftwidth=2
set nosmartindent
syntax on

colorscheme onehalfdark

set number
set is hls


let g:python_highlight_all = 1
let g:ale_completion_enabled = 1
nnoremap :ad :ALEDetail
nnoremap :ag :ALEGoToDefinition
nnoremap :ah :ALEHover
set laststatus=2
set exrc
set secure
