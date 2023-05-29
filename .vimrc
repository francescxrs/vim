" Enable syntax hightlighting
syntax on
" Enables filetype detection
filetype on
" When a file is edited its plugin file is loaded (if there is one for the detected filetype)
filetype plugin on
" When a file is edited its indent file is loaded (if there is one for the detected filetype)
filetype indent on

set number
set relativenumber
set mouse=a
set tabstop=4
set shiftwidth=4
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

" Configuració de highlights
set hlsearch


" NeoVim Vim-Plug
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
	" Millora la syntax de js
	Plug 'jelera/vim-javascript-syntax'
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
	" Fuzzy Finder : It's an interactive Unix filter for command-line that can be used with 
	" any list; files, command history, processes, hostnames, bookmarks, git commits, etc.
	" Requereix instal·lar fzf al sistema via terminal prèviament via git clone o altres..
	" Requereix bat (cat with wings) per previsualitzar a color
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
call plug#end()

" Plugin pel colorscheme previament instal·lat
colorscheme meh

" Redefinim highlights segons interès
" 240 és equivalent a #585858
hi NonText ctermfg=240 gui=italic guifg=#70788a
hi WebDevIconsDefaultFolderSymbol ctermfg=11
hi clear SpellBad
hi SpellBad cterm=undercurl guisp=NONE ctermfg=NONE ctermbg=NONE gui=undercurl guifg=NONE guibg=NONE

" Definim nous highlights
hi EspaisFinals ctermbg=218 guibg=7
hi MyTabs ctermfg=11 guibg=#fff8a
" Definim els pattern matches pels highlights en qüestió
match EspaisFinals /\s\{1,200}$/
2match MyTabs /\t/

" Indent-Blankline
let g:indent_blankline_char = '▏'
let g:indent_blankline_char_blankline = ''
let g:indent_blankline_space_char = ''
let g:indent_blankline_space_char_blankline = ''
let g:indent_blankline_show_end_of_line = v:true
" Perquè mostri els tabs com a espais continuats que per defecte son guions, 
" i els espais a final de linea com a espais que per defecte són també guions.
set listchars=tab:>\ ,trail:\ 
set list
" Afegim codi en lua a vimrc
lua << EOF
	vim.opt.list = true
	-- Representem espai amb símbol
	vim.opt.listchars:append "space: "
	vim.opt.listchars:append "tab:  "
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


" NerdTree 
" Mostrem arxius ocults.
let NERDTreeShowHidden=1


" Emmet
" div;;, donarà <div><div>
let g:user_emmet_leader_key=';;'


" Lightline
" Configuració de lightline
let g:lightline = {
	\'separator': { 'left': '', 'right': '' },
	\'active' : {
	\	'left': [ [ 'mode', 'paste' ],[ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
	\	'right': [ [ 'lineinfo' ],[ 'percent' ],[ 'fileformat', 'fileencoding', 'filetype' ] ]
  	\}
\}


" Fuzzy Finder
" Check blacksuan19/init.vim
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'border': 'sharp' } }
let g:fzf_tags_command = 'ctags -R'
let $FZF_DEFAULT_OPTS = '--layout=reverse --inline-info'


" EZ-Window
let g:resize_start_key = '<C-r>'  " Inicialment Ctrl-m no funciona. En reasignar sí. 


" (Non Recursive)Remaps 
let mapleader = ","
	" Fuzzy Finder remaps
	noremap <leader>aq :Files<CR>
	noremap <leader>aa :Rg<CR>
	" Spell check
	noremap <leader>coca :setlocal spell spelllang=ca <Bar> :set spell<CR><CR>
	noremap <leader>coes :setlocal spell spelllang=es_ES <Bar> :set spell<CR><CR>
	noremap <leader>coin :setlocal spell spelllang=en_EN <Bar> :set spell<CR><CR>
	noremap <leader>cono :set nospell<CR>
	" NerdTree remaps
	noremap <leader>de :NERDTree<CR>
	noremap <leader>dd :NERDTreeToggle<CR>
	" Telescope remaps
	noremap <leader>ff :Telescope find_files<CR>
	noremap <leader>fg :Telescope live_grep<CR>
	noremap <leader>fb :Telescope buffers<CR>
	noremap <leader>fh :Telescope help_tags<CR>
	" Latex to...
	noremap <leader>lp :w <Bar> :! pdflatex %<CR><CR>
	noremap <leader>lz :! zathura $(echo % \| sed 's/tex$/pdf/') & disown<CR><CR>
	" Markdown to...
	noremap <leader>mp :w <Bar> :! pandoc -V lang="es" --highlight-style tango --toc -N % -o $(echo % \| sed 's/md$/pdf/')
	noremap <leader>mz :! zathura $(echo % \| sed 's/md$/pdf/') & disown<CR><CR>
	" Altres
	noremap <leader>qq :q!<CR>
	noremap <leader>tt :tabnew<CR>
	noremap <leader>th :botright new <Bar> :terminal<CR>
	noremap <leader>tv :botright vnew <Bar> :terminal<CR>
	noremap <leader>ww :w<CR>
	noremap <leader>wq :wq<CR>
