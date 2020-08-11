"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
filetype off

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'airblade/vim-gitgutter'
Plugin 'dense-analysis/ale'
Plugin 'hashivim/vim-consul'
Plugin 'hashivim/vim-nomadproject'
Plugin 'hashivim/vim-packer'
Plugin 'hashivim/vim-terraform'
Plugin 'hashivim/vim-vagrant'
Plugin 'hashivim/vim-vaultproject'
Plugin 'pearofducks/ansible-vim'
Plugin 'preservim/nerdtree'
Plugin 'python-mode/python-mode'
Plugin 'sbdchd/neoformat'
Plugin 'Xuyuanp/nerdtree-git-plugin'

call vundle#end()

" Enable Pathogen
execute pathogen#infect()
syntax on
filetype plugin indent on

" vim-markdown disable the folding
let g:vim_markdown_folding_disabled = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" Leader
let mapleader = " "

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Always show current position
set ruler

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Enable line numbers
set number

" Force the cursor onto a new line after 80 characters
set textwidth=80

" However, in Git commit messages, let’s make it 72 characters
autocmd FileType gitcommit set textwidth=72

" Colour the 81st (or 73rd) column so that we don’t type over our limit
set colorcolumn=+1

" In Git commit messages, also colour the 51st column (for titles)
autocmd FileType gitcommit set colorcolumn+=51

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ALE settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Open a NERDTree automatically when vim starts up
autocmd vimenter * NERDTree

" open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Terraform settings
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Allow vim-terraform to align settings automatically with Tabularize
let g:terraform_align=1

" Allow vim-terraform to automatically fold (hide until unfolded) sections of 
" terraform code. Defaults to 0 which is off
let g:terraform_fold_sections=0

" Allow vim-terraform to automatically format *.tf and *.tfvars files with
" terraform fmt. You can also do this manually with the :TerraformFmt command.
let g:terraform_fmt_on_save=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile
