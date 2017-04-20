let mapleader = ','
let leader = ','
set nocompatible              			" required
filetype off                  			" required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'		    	" let Vundel manage Plugins

" Add all your plugins here
Plugin 'ReplaceWithRegister'			" augments
Plugin 'airblade/vim-gitgutter'
Plugin 'ap/vim-css-color'		    	" color preview
Plugin 'benekastah/neomake' 			" linter
Plugin 'bling/vim-airline'	    		" pretty status lines
Plugin 'ctrlpvim/ctrlp.vim'		    	" a fuzzy file finder
Plugin 'easymotion/vim-easymotion' 		" <leader><leader>motion
Plugin 'ervandew/supertab'		       	" enhances tab completion
Plugin 'fisadev/dragvisuals.vim' 		" drag Visual blocks
Plugin 'gerw/vim-latex-suite'           	" full featured latex plugin
Plugin 'glench/vim-jinja2-syntax'
Plugin 'hail2u/vim-css3-syntax'			" CSS3 syntax support for Vim’s built-in syntax/css.vim
Plugin 'jlanzarotta/bufexplorer'		" move from buffer to buffer
Plugin 'majutsushi/tagbar'			" keeps you honest w/tags
Plugin 'shougo/neocomplete.vim' 		" completion assistant
Plugin 'shougo/neosnippet-snippets' 		" snippet library
Plugin 'shougo/neosnippet.vim'
Plugin 'taglist.vim'
Plugin 'terryma/vim-multiple-cursors'		" just like in sublime text
Plugin 'tommcdo/vim-exchange'			" moves marked text easily
Plugin 'tpope/vim-commentary'			" comment utility
Plugin 'tpope/vim-dispatch'		    	" for async scripts
Plugin 'tpope/vim-fugitive' 			" vim git intagration
Plugin 'tpope/vim-repeat'               	" works with many plugins
Plugin 'tpope/vim-sensible'             	" a set useful mappings
Plugin 'tpope/vim-surround'             	" surronds text with whatever you want
Plugin 'tpope/vim-vinegar'              	" works with ctrlp
Plugin 'vim-airline/vim-airline-themes'		" multiple themes for airline
Plugin 'wincent/ferret'                 	" like ack on steroids
Plugin 'xolox/vim-easytags'			" automates tag generation
Plugin 'xolox/vim-misc'				" required by easytags
" All of your Plugins must be added before the following line
call vundle#end()            			" required
filetype plugin indent on    			" required

set guifont=Droid\ Sans\ Mono\ for\ Powerline:h15   " to keep airline happy
set hlsearch					                    " highlight search
set incsearch					                    " incremental search
set number					                        " display line numbers
set path+=**                                        " use everything
set relativenumber                                  " curser always on line zero
set showmatch                                       " highlight matches
set wildmenu                                        " displays all matching files for tab complete
set undodir=$HOME/.vim/undo                         " save undo histories here
set undofile                                        " Save undo's
set undolevels=1024                                 " How many undos
set undoreload=16384                                " number of lines to save

colorscheme desert				                    " much better for the eyes

" unfold all
nnoremap <space> zR

" move curser from split to split
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" the next few lines are used to work with the .vimrc file
nnoremap <silent> <leader>er :e $MYVIMRC<CR>
nnoremap <silent> <leader>wr :w<CR> :so $MYVIMRC<CR>
nnoremap <silent> <leader>pr :w<CR> :so $MYVIMRC<CR> :PluginInstall<CR>

"parameters for airline
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1
let g:airline_skip_empty_sections=1
let g:Powerline_symbols='fancy'
set t_Co=256
set encoding=utf-8
set fillchars+=stl:\ ,stlnc:\
set termencoding=utf-8
AirlineTheme ubaryd						        " again, easy on the eyes

autocmd BufWritePre * :%s/\s\+$//e				" lose the trailing spaces

let g:tagbar_ctags_bin='/usr/local/bin/ctags'  	" Proper Ctags location
let g:tagbar_width=32                          	" Default is 40, seems too wide
nnoremap <F8> :TagbarToggle<CR>

"hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
"hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
se cursorline
se cursorcolumn
nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

autocmd BufRead *.html,*.htm,*.css se ts=2 sw=2 expandtab st=2 si
autocmd BufRead *.cpp,*.c,*.ino,*.py se ts=4 sw=4 expandtab st=4 si

:let g:easytags_always_enabled = 1
:let g:easytags_async = 1

no <up> ddkP
no <down> ddp
no <left> :bp<CR>
no <right> :bn<CR>

ino <up> <Nop>
ino <down> <Nop>
ino <left> <Nop>
ino <right> <Nop>

"Neomake configuration
autocmd! BufWritePost * Neomake

set grepprg=grep\ -nH\ $*
filetype indent on
let g:tex_flavor='latex'

" just the 81st column of wide lines...
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

" enable all Python syntax highlighting features
let python_highlight_all = 1

" per Damion @ OSCON2013
vmap <expr> <LEFT> DVB_Drag('left')
vmap <expr> <RIGHT> DVB_Drag('right')
vmap <expr> <UP> DVB_Drag('up')
vmap <expr> <DOWN> DVB_Drag('down')
