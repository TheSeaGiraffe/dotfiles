call plug#begin('~/.config/nvim/plugged')

"-----------
" My plugins
"-----------

" Plugins which add functionality
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-dispatch'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --cs-completer' }
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Aesthetic plugins
Plug 'powerline/fonts', { 'do': './install.sh' }

" Vim colors
Plug 'reedes/vim-colors-pencil'
Plug 'morhetz/gruvbox'
Plug 'rakr/vim-one'
Plug 'Marfisc/vorange'
Plug 'dikiaap/minimalist'
Plug 'ashfinal/vim-colors-violet'
Plug 'ashfinal/vim-colors-paper'
Plug 'dracula/vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'kabbamine/yowish.vim'
Plug 'sjl/badwolf'
Plug 'tomasr/molokai'
Plug 'AlessandroYorba/Alduin'
Plug 'AlessandroYorba/Sierra'
Plug 'danilo-augusto/vim-afterglow'

call plug#end()

"-----------------
" General features
"-----------------

" Remap leader key
nmap <space> <leader>

" Remap Escape key
imap jk <Esc>

" Disable mouse support
set mouse=""

" Enable cursor line
set cursorline

" Enable line numbers
set number

" Enable relative line numbers
set relativenumber

" Enable autoindent
set autoindent

" Copy the previous indentation on autoindenting
set copyindent

" Enable hidden buffers
set hidden

" Highlight search terms
set hlsearch

" Disable mode indicator since airline handles that for us.
set noshowmode

" Remove highlighting after a search
nmap <leader>nh :noh<CR>

" Set the indentation
set tabstop=4
set shiftwidth=0
set smarttab

" Set the line width
" I'll have to see if there is a way to limit this to files that have no
" extensions
set tw=90

" Have tabs be expanded to spaces for Python, R, and m files
au FileType python setlocal expandtab tw=80
au FileType r setlocal expandtab tw=80

" Have tabs be kept tabs in text, c++, java, and scala files
au FileType text setlocal noexpandtab tw=90
au FileType cpp setlocal noexpandtab tw=90
au FileType java setlocal noexpandtab tw=90
au FileType scala setlocal noexpandtab tw=90

" Open new empty buffer in current window and save it as a file of the user's
" choosing.
nmap <leader>n :enew<CR>:saveas

" Save file as...
nmap <leader>sa :saveas

" Save all open buffers
nmap <leader>ss :wa<CR>

" Save file and refresh buffer
nmap <leader>r :w<CR>:e<CR>

" Open .vimrc file in new buffer for editing
nmap <leader>ev :e /home/fahmi/.config/nvim/init.vim<CR>

" Source .vimrc file
nmap <leader>so :source /home/fahmi/.config/nvim/init.vim<CR>

" Insert new line below current line from normal mode
nmap <leader>o o<Esc>

" Insert new line above current line from normal mode
nmap <leader>O O<Esc>

" Make current pane the only visible pane
nmap <leader>on :on<CR>

"--------------
" Window splits
"--------------

" Split the window horizontally
nmap <leader>sh :sp<CR>

" Split the window vertically
nmap <leader>sv :vsp<CR>

" Create a terminal in a horizontal split
nmap <leader>sht :sp term://bash<CR>

" Create a terminal in a vertical split
nmap <leader>svt :vsp term://bash<CR>

" Remap keys for switching between windows
nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l

" Remap keys for switching between windows when a terminal is active
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-W>h
nnoremap <A-j> <C-W>j
nnoremap <A-k> <C-W>k
nnoremap <A-l> <C-W>l

" Make windows split more naturally
set splitbelow
set splitright

"-----------------
" Managing buffers
"-----------------

" Open a new empty buffer
nmap <leader>T :enew<CR>

" Move to the next buffer
nmap <leader>l :bnext<CR>

" Move to the previous buffer
nmap <leader>h :bprevious<CR>

" Close the current buffer and move to the previous one
nmap <leader>bq :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>

" Move to previously edited buffer
nmap <tab> :b#<CR>

" Close/delete current buffer
nmap <C-C> :bd<CR>


"----------------
" Vim colorscheme
"----------------

" Enable true color if the terminal supports it
if (has("termguicolors"))
	set termguicolors
endif

" Set the background color
set background=dark

" Set the vim colorscheme
"let g:gruvbox_italic = 1
"let g:gruvbox_contrast_dark = 'hard'
"color gruvbox
color minimalist
"let g:airline_theme = 'badwolf'
"let g:airline_theme = 'pencil'
"let g:airline_theme = 'vorange'

"---------------
" Airline plugin
"---------------

" Set vim-airline status bar to appear at startup
set laststatus=2

" Enable powerline fonts
let g:airline_powerline_fonts = 1

" Prevents airline from drawing separators on empty sections
" (Gets rid of orange arrows)
let g:airline_skip_empty_sections = 1

" Enable the list of buffers
"let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

"-------------
" CtrlP Plug
"-------------

" Set ignores
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = {
	\'dir': '\v[\/]\.(git|hg|svn)$',
	\'file': '\v\.(exe|so|dll)$'
	\}

" Invoke CtrlP (regular mode?)
nmap <leader>p :CtrlP<CR>

" Invoke CtrlP but allows me to select a directory
nmap <leader>pd :CtrlP

" Buffer mode
nmap <leader>pb :CtrlPBuffer<CR>

" Mixed mode. Searches files, buffers and MRUs
nmap <leader>pm :CtrlPMixed<CR>

" MRU (Most Recently Used) mode
nmap <leader>ps :CtrlPMRU<CR>

"-----------------
" NERD tree plugin
"-----------------

" Open NERD tree panel
nmap <leader>d :NERDTreeToggle<CR>

"---------------
" NERD commenter
"---------------

" Remap most used NERD commenter bindings to use 'g' instead of leader key

" Commenting out current line
nmap gcc <leader>cc

" Commenting out nested code
nmap gcn <leader>cn

" Comment out block of code using nicer format
nmap gcs <leader>cs

" Yank lines before commenting
nmap gcy <leader>cy

" Toggle comment state of entire block
nmap gct <leader>c<space>

" Toggle comment state of individual comment
nmap gci <leader>ci

"--------------
" YouCompleteMe
"--------------

" Set to use global ycm_extra_conf.py file
let g:ycm_global_ycm_extra_conf = "~/.ycm_extra_conf.py"

" Automatically close preview window after completion
let g:ycm_autoclose_preview_window_after_completion = 1

" Automatically close preview window after insertion
let g:ycm_autoclose_preview_window_after_insertion = 1

"-----------------
" Syntastic plugin
"-----------------

" Set Syntastic compiler for C++
let g:syntastic_cpp_compiler = "g++"

" Set Syntastic C++ compiler options
let g:syntastic_cpp_compiler_options = "-std=c++11 -stdlib=libc++"
