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
	" Fuzzy Finder : It's an interactive Unix filter for command-line that can be used with 
	" any list; files, command history, processes, hostnames, bookmarks, git commits, etc.
	" Requereix instal·lar fzf al sistema via terminal prèviament via git clone o altres..
	" Requereix bat (cat with wings) per previsualitzar a color
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
	" Plugin per colorscheme
	Plug 'davidosomething/vim-colors-meh'
call plug#end()

" Set pel colorscheme previament instal·lat
colorscheme meh
"
" Modifiquem highlights
" Per a simbols end of line i similars
hi NonText ctermfg=240 gui=italic guifg=#70788a
" Carpetes a NerdTree
hi WebDevIconsDefaultFolderSymbol ctermfg=11
" Per a corrector
hi SpellBad cterm=undercurl guisp=NONE ctermfg=NONE ctermbg=NONE gui=undercurl guifg=NONE guibg=NONE

" Visualitzem alguns caràcters amb certs símbols
set list
set listchars=tab:\│\ ,eol:↴

" Definim nous highlights
hi EspaisFinals ctermbg=218 ctermfg=NONE guibg=7 guifg=NONE 
" Definim i visualitzem cada tab
	hi MyTabOne ctermbg=NONE ctermfg=230 guifg=#fff8d7 guibg=NONE
		hi MyTabTwo ctermbg=NONE ctermfg=229 guibg=#ffffaf guibg=NONE
			hi MyTabThree ctermbg=NONE ctermfg=228 guibg=#ffff87 guibg=NONE
				hi MyTabFour ctermbg=NONE ctermfg=227 guibg=#ffff5f guibg=NONE
					hi MyTabFive ctermbg=NONE ctermfg=221 guibg=#ffd75f guibg=NONE
						hi MyTabSix ctermbg=NONE ctermfg=220 guibg=#ffd700 guibg=NONE
							hi MyTabSeven ctermbg=NONE ctermfg=226 guibg=#ffff00 guibg=NONE
								hi MyTabEight ctermbg=NONE ctermfg=214 guibg=#ffaf00 guibg=NONE
									hi MyTabNine ctermbg=NONE ctermfg=208 guibg=#ff8700 guibg=NONE
										hi MyTabTen ctermbg=NONE ctermfg=202 guibg=#ff5f00 guibg=NONE
											hi MyTabEleven ctermbg=NONE ctermfg=196 guibg=#ff0000  guibg=NONE
												hi MyTabTwelve ctermbg=NONE ctermfg=197 guibg=#ff005f guibg=NONE
													hi MyTabThirteen ctermbg=NONE ctermfg=198 guibg=#ff0087 guibg=NONE
														hi MyTabFourteen ctermbg=NONE ctermfg=199 guibg=#ff00af guibg=NONE
															hi MyTabFifteen ctermbg=NONE ctermfg=200 guibg=#ff00d7 guibg=NONE
																hi MyTabSixteen ctermbg=NONE ctermfg=207 guibg=#ff5fff guibg=NONE
																	hi MyTabSeventeen ctermbg=NONE ctermfg=201 guibg=#ff00ff guibg=NONE
																		hi MyTabEighteen ctermbg=NONE ctermfg=201 guibg=#af5faf guibg=NONE
																			hi MyTabNineteen ctermbg=NONE ctermfg=201 guibg=#af5fd7 guibg=NONE
																				hi MyTabTwenty ctermbg=NONE ctermfg=135 guibg=#af5fff guibg=NONE
" Afegim el color de background per a hi Normal
hi MyOtherTabs ctermbg=NONE ctermfg=235 guifg=#202022 guibg=NONE

" Definim els pattern matches pels highlights en qüestió
" Regex funcional pero amb mal pas a matchadd: '(?<=^\t\t)(\t)(?=[a-z])'
call matchadd("EspaisFinals",'\s\{1,\}$')
call matchadd("MyOtherTabs",'\t')
call matchadd("MyTabTwenty",'^\t\{20\}')
call matchadd("MyTabNineteen",'^\t\{19\}')
call matchadd("MyTabEighteen",'^\t\{18\}')
call matchadd("MyTabSeventeen",'^\t\{17\}')
call matchadd("MyTabSixteen",'^\t\{16\}')
call matchadd("MyTabFifteen",'^\t\{15\}')
call matchadd("MyTabFourteen",'^\t\{14\}')
call matchadd("MyTabThirteen",'^\t\{13\}')
call matchadd("MyTabTwelve",'^\t\{12\}')
call matchadd("MyTabEleven",'^\t\{11\}')
call matchadd("MyTabTen",'^\t\{10\}')
call matchadd("MyTabNine",'^\t\{9\}')
call matchadd("MyTabEight",'^\t\{8\}')
call matchadd("MyTabSeven",'^\t\{7\}')
call matchadd("MyTabSix",'^\t\{6\}')
call matchadd("MyTabFive",'^\t\{5\}')
call matchadd("MyTabFour",'^\t\{4\}')
call matchadd("MyTabThree",'^\t\{3\}')
call matchadd("MyTabTwo",'^\t\{2\}')
call matchadd("MyTabOne",'^\t\{1\}')


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
\	'ctrl-t': 'tab split',
\	'ctrl-x': 'split',
\	'ctrl-v': 'vsplit' }
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


" Chuletairo
" cterm en número, gui en hex.

"0		Black (SYSTEM)		#000000	rgb(0,0,0)			hsl(0,0%,0%)
"1		Maroon (SYSTEM)		#800000	rgb(128,0,0)		hsl(0,100%,25%)
"2		Green (SYSTEM)		#008000	rgb(0,128,0)		hsl(120,100%,25%)
"3		Olive (SYSTEM)		#808000	rgb(128,128,0)		hsl(60,100%,25%)
"4		Navy (SYSTEM)		#000080	rgb(0,0,128)		hsl(240,100%,25%)
"5		Purple (SYSTEM)		#800080	rgb(128,0,128)		hsl(300,100%,25%)
"6		Teal (SYSTEM)		#008080	rgb(0,128,128)		hsl(180,100%,25%)
"7		Silver (SYSTEM)		#c0c0c0	rgb(192,192,192)	hsl(0,0%,75%)
"8		Grey (SYSTEM)		#808080	rgb(128,128,128)	hsl(0,0%,50%)
"9		Red (SYSTEM)		#ff0000	rgb(255,0,0)		hsl(0,100%,50%)
"10		Lime (SYSTEM)		#00ff00	rgb(0,255,0)		hsl(120,100%,50%)
"11		Yellow (SYSTEM)		#ffff00	rgb(255,255,0)		hsl(60,100%,50%)
"12		Blue (SYSTEM)		#0000ff	rgb(0,0,255)		hsl(240,100%,50%)
"13		Fuchsia (SYSTEM)	#ff00ff	rgb(255,0,255)		hsl(300,100%,50%)
"14		Aqua (SYSTEM)		#00ffff	rgb(0,255,255)		hsl(180,100%,50%)
"15		White (SYSTEM)		#ffffff	rgb(255,255,255)	hsl(0,0%,100%)
"
"
" Afegim codi en lua a vimrc
"lua << EOF
"	vim.opt.list = true
"EOF
