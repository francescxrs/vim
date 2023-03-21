syntax on
filetype on
filetype plugin on
filetype indent on

call plug#begin('~/.vim/plugged')
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'preservim/nerdcommenter'
Plug 'lukas-reineke/indent-blankline.nvim'
call plug#end()

set number
set relativenumber
set mouse=a
set tabstop=4
set nobackup
set background=dark
set noshowmode

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

" (No)Remaps 
let mapleader = ","
noremap <leader>ff :Telescope find_files<CR>
noremap <leader>fg :Telescope live_grep<CR>
noremap <leader>fb :Telescope buffers<CR>
noremap <leader>fh :Telescope help_tags<CR>
noremap <leader>w :w<CR>
noremap <leader>e :NERDTree<CR>
noremap <leader>d :NERDTreeToggle<CR>
noremap <leader>tv :botright vnew <Bar> :terminal<CR>
noremap <leader>th :botright new <Bar> :terminal<CR>
noremap <leader>,t :! pdflatex %<CR><CR>
noremap <leader>,z :! zathura $(echo % \| sed 's/tex$/pdf/') & disown<CR><CR>



