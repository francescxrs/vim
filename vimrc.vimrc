" Enable syntax hightlighting
" Enables filetype detection
" When a file is edited its plugin file is loaded (if there is one for the detected filetype)
" When a file is edited its indent file is loaded (if there is one for the detected filetype)
syntax on
filetype on
filetype plugin on
filetype indent on

" For NeoVim vim-plug plugins 
call plug#begin('~/.vim/plugged')
	" Adds filetype glyphs (icons) to various vim plugins
	" Supports plugins such as NERDTree, vim-airline, CtrlP, powerline, denite, unite, 	
	" lightline.vim, vim-startify, vimfiler, vim-buffet and flagship.
	Plug 'ryanoasis/vim-devicons'
	" This adds syntax for nerdtree on most common file extensions
	" Modificar colors a nerdtree.vim per a cada extensió
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
	" Plugin per colorscheme
	Plug 'davidosomething/vim-colors-meh'
	" Llibreria lua necessària per telescope etc.
	Plug 'nvim-lua/plenary.nvim'
	" Cercador d'arxius o text 
	Plug 'nvim-telescope/telescope.nvim'
	" Per comentar o descomentar línees o blocs de codi
	Plug 'preservim/nerdcommenter'
	" Per millorar hightlighting etc.
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	" This plugin adds indentation guides to all lines (including empty lines)
	Plug 'lukas-reineke/indent-blankline.nvim'
	" Fuzzy Finder: It's an interactive Unix filter for command-line that can be used with 
	" any list; files, command history, processes, hostnames, bookmarks, git commits, etc.
	" Requereix instal·lar fzf al sistema via terminal prèviament via git clone o altres..
	" Requereix bat (cat with wings) per previsualitzar a color
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

" Plugin pel colorscheme previament instal·lat
colorscheme meh

set hlsearch
hi NonText ctermfg=240 gui=italic guifg=#70788a
hi WebDevIconsDefaultFolderSymbol ctermfg=11

let g:indent_blankline_char = '▏'
let g:indent_blankline_char_blankline = ''
let g:indent_blankline_space_char = ''
let g:indent_blankline_space_char_blankline = ''
let g:indent_blankline_show_end_of_line = v:true

" Indent-Blankline
" Perquè mostri els tabs com a espais continuats que per defecte son guions, 
" i els espais a final de linea com a espais que per defecte són també guions.
set listchars=tab:>\ ,trail:\ 
set list
" Afegim codi en lua a vimrc
lua << EOF
	vim.opt.list = true
	-- Representem espai amb símbol
	vim.opt.listchars:append "space: "
	-- Representem salt de línea amb símbol
	vim.opt.listchars:append "eol:↴"
	require("indent_blankline").setup {
		-- Activem marca de bloc entre claus
		show_current_context = true,
    	show_current_context_start = true,
    	-- Activem símbol per fi de línea
		show_end_of_line = true,
		-- Espais de les linies en blanc
		space_char_blankline = " ",
		-- Highlight per les línies verticals i els espais respectius,
		-- Aprofitem el grup Comment. A vim cmd check :hi per veure la llista 
		char_highlight_list = { "Comment", },
	}
EOF

" Mostrem arxius ocults a nerdtree.
let NERDTreeShowHidden=1

" Pel plug emmet. Eg. div;;, donarà <div><div>
let g:user_emmet_leader_key=';;'

" Configuració de lightline
let g:lightline = {
	\'separator': { 'left': '', 'right': '' },
	\'active' : {
	\	'left': [ [ 'mode', 'paste' ],[ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
	\ 	'right': [ [ 'lineinfo' ],[ 'percent' ],[ 'fileformat', 'fileencoding', 'filetype' ] ]
  	\}
\}

" Configuració de Fuzzy Finder (check blacksuan19/init.vim)
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'border': 'sharp' } }
let g:fzf_tags_command = 'ctags -R'
let $FZF_DEFAULT_OPTS = '--layout=reverse --inline-info'

" (Non Recursive)Remaps 
let mapleader = ","
	" General remaps
	noremap <leader>w :w<CR>
	" Telescope remaps
	noremap <leader>ff :Telescope find_files<CR>
	noremap <leader>fg :Telescope live_grep<CR>
	noremap <leader>fb :Telescope buffers<CR>
	noremap <leader>fh :Telescope help_tags<CR>
	" Fuzzy Finder remaps
	noremap <leader>aq :Files<CR>
	noremap <leader>aa :Rg<CR>
	" NerdTree remaps
	noremap <leader>de :NERDTree<CR>
	noremap <leader>dd :NERDTreeToggle<CR>
	" Terminal actions remaps
	noremap <leader>tv :botright vnew <Bar> :terminal<CR>
	noremap <leader>th :botright new <Bar> :terminal<CR>
	noremap <leader>,tt :! pdflatex %<CR><CR>
	noremap <leader>,zz :! zathura $(echo % \| sed 's/tex$/pdf/') & disown<CR><CR>
	
" Custom banner
let g:startify_custom_header = [
 \'',
 \'       __      __        __         ',
 \'      / /___  / /_  ____/ /__  _____',
 \'     / / __ \/ __ \/ __  / _ \/ ___/',
 \'    / / /_/ / / / / /_/ /  __/ /    ',
 \'   /_/\____/_/ /_/\__,_/\___/_/     ',                              
 \ '',
 \]
