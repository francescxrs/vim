syntax on
filetype on
filetype plugin on
filetype indent on

call plug#begin('~/.vim/plugged')
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim'
	Plug 'preservim/nerdcommenter'
	Plug 'lukas-reineke/indent-blankline.nvim'
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
call plug#end()

set number
set relativenumber
set mouse=a
set tabstop=4
set nobackup
set background=dark
set noshowmode
set encoding=UTF-8

set omnifunc=javascriptcomplete#CompleteJS
set omnifunc=htmlcomplete#CompleteTags
set omnifunc=csscomplete#CompleteCSS
set omnifunc=phpcomplete#CompletePHP

set complete+=kspell
set completeopt=menuone,longest
set shortmess+=c

colorscheme codedark

let NERDTreeShowHidden=1
let g:user_emmet_leader_key=';;'
let g:lightline = {
	\'separator': { 'left': '', 'right': '' },
	\'active' : {
	\	'left': [ [ 'mode', 'paste' ],[ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
	\ 	'right': [ [ 'lineinfo' ],[ 'percent' ],[ 'fileformat', 'fileencoding', 'filetype' ] ]
  	\}
\}

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'border': 'sharp' } }
let g:fzf_tags_command = 'ctags -R'
let $FZF_DEFAULT_OPTS = '--layout=reverse --inline-info'

" (No)Remaps 
let mapleader = ","

	noremap <leader>ff :Telescope find_files<CR>
	noremap <leader>fg :Telescope live_grep<CR>
	noremap <leader>fb :Telescope buffers<CR>
	noremap <leader>fh :Telescope help_tags<CR>
	noremap <leader>w :w<CR>

	noremap <leader>qq :Files<CR>
	noremap <leader>aa :Rg<CR>

	noremap <leader>de :NERDTree<CR>
	noremap <leader>dd :NERDTreeToggle<CR>

	noremap <leader>tv :botright vnew <Bar> :terminal<CR>
	noremap <leader>th :botright new <Bar> :terminal<CR>

	noremap <leader>,t :! pdflatex %<CR><CR>
	noremap <leader>,z :! zathura $(echo % \| sed 's/tex$/pdf/') & disown<CR><CR>
