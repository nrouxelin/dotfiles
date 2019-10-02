" NOTE : TO RELOAD .vimrc USE :so %
execute pathogen#infect()
colorscheme dracula
syntax enable
set number
set hlsearch
set incsearch

" remap leader (defaul is \, not very practical on a mac)
let mapleader = ","

" turn off search highlight (<CR> == retour chariot)
nnoremap <leader><space> :nohlsearch<CR>

" More natural splitting
set splitright
set splitbelow

" newtrw default list style :tree
let g:netrw_liststyle = 3
"let g:netrw_browse_split = 4
let g:netrw_banner = 0

" Compatibility with tmux theme
set background=dark
set t_Co=256


" Use jk as escape key
inoremap jk <esc>

" Folding
set foldmethod=indent

" Better resizing
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

" Better tag jump 
nnoremap t <C-]>


" COnfiguration for indent
filetype plugin indent on
set tabstop=2
set shiftwidth=2
set expandtab

" Wildmenu -- COmpletion for file names
if has("wildmenu")
  set wildignore+=*.a,*.o
  set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
  set wildignore+=.DS_Store,.git,.hg,.svn
  set wildignore+=*~,*.swp,*.tmp
  set wildmenu
  set wildmode=longest,list
endif

" Config statusline -- PLugin Airline
let g:lightline = {
      \ 'colorscheme': 'Dracula'
      \}
set laststatus=2
set noshowmode

" Folders for auto finding (using :tabfind) : current dir, sub-dirs)
set path =.,,**

" Always display one line above and one line below cursor
if !&scrolloff
  set scrolloff=1
endif
if !&sidescrolloff
  set sidescrolloff=5
endif
set display+=lastline

" Disable arrow movement, resize splits instead.
let g:elite_mode=1
if get(g:, 'elite_mode')
  nnoremap <Up>    :resize +2<CR>
  nnoremap <Down>  :resize -2<CR>
  nnoremap <Left>  :vertical resize -2<CR>
  nnoremap <Right> :vertical resize +2<CR>
endif
