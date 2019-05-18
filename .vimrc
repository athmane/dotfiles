" Plugins (any line with the marker will be git-cloned into vim dir)
"__ https://github.com/scrooloose/nerdtree
"__ https://github.com/itchyny/lightline.vim
"__ https://github.com/ap/vim-buftabline
"

" Basic settings
set tabstop=8
set expandtab
set shiftwidth=4
set softtabstop=4
""
set nocompatible
set backspace=indent,eol,start
set history=1000
set undolevels=1000
syntax on
set hlsearch
"set textwidth=79
"set lbr
set smarttab
"set smartindent
set autoindent
set shiftround
set backspace=indent,eol,start
set number
"set relativenumber
set incsearch
set laststatus=2
"set t_Co=256
"set cindent
set hidden "dont ask about unsaved buffers
"set mouse=a
set background=dark
set wildmenu
set path+=**
colorscheme desert
set cursorline

" desert colorscheme fixes
hi CursorLine cterm=none term=none
hi Pmenu ctermbg=darkgrey ctermfg=white guibg=darkgrey guifg=white
hi PmenuSel ctermbg=darkblue ctermfg=white guibg=darkblue guifg=white


if has("gui_running")
    "set guioptions-=T
    "set guioptions-=m
    "set go=c
    " Console + X11 Clipboard
    set go=ca
    set guifont=Monospace\ 12
endif

if has("win32")
    set guifont=Consolas:h11:cANSI
    set shell=powershell
    set shellcmdflag=-command
    set guicursor=a:blinkon0
    au GUIEnter * simalt ~x
endif


" Folding
"set foldmethod=indent

autocmd CompleteDone * pclose
filetype plugin indent on

" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif

" Keymaps
"map <leader>p "+gP
"map <leader>y "+y
map <leader>r :make<CR>
map <leader>s :set spell!<CR>
map <leader>e :NERDTreeToggle<CR>

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
nmap <C-j> :bp<CR>
imap <C-j> :bp<CR>
nmap <C-k> :bn<CR>
imap <C-k> :bn<CR>

" vim password manager
set cryptmethod=blowfish

" Make helpers
autocmd FileType spec set makeprg=rpmbuild\ -ba\ %
autocmd FileType yaml set makeprg=ansible-lint\ %
autocmd BufWritePost,FileWritePost *.go execute 'Lint' | cwindow
"autocmd FileType python set makeprg=python\ %
"autocmd FileType python set makeprg=pyflakes\ %
"autocmd FileType python set errorformat=%f:%l:\ %m
"autocmd BufWritePost *.py !flake8 %

" Override default for certain filetypes
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" Highlight extra stuff
autocmd Syntax * call matchadd('Todo',  '\W\zs\(TODO\|FIXME\|CHANGED\|XXX\|BUG\|HACK\)')
autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\)')
highlight link sensibleWhitespaceError Error
autocmd Syntax * syntax match sensibleWhitespaceError excludenl /\s\+\%#\@<!$\| \+\ze\t/ display containedin=ALL

ab __fp Athmane Madjoudj <athmane@fedoraproject.org>
ab __ms Othmane Madjoudj <omadjoudj@mirantis.com>
