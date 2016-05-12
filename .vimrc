call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'git://git.wincent.com/command-t.git'
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}

" My Plugins
Plug 'derekwyatt/vim-scala'
Plug 'kien/ctrlp.vim'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/target*,.idea*

Plug 'Valloric/YouCompleteMe'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'mdreves/vim-scaladoc'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'spiroid/vim-ultisnip-scala'
Plug 'tpope/vim-unimpaired'
Plug 'vim-scripts/BufOnly.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'bling/vim-airline'
Plug 'tomasr/molokai'
Plug 'airblade/vim-gitgutter'
Plug 'reedes/vim-lexical'
Plug 'bufkill.vim'
Plug 'ensime/ensime-vim'
Plug 'suan/vim-instant-markdown'
Plug 'idris-hackers/idris-vim'

call plug#end()

filetype plugin indent on    " required

" My Config
filetype plugin on
syntax on
set number
set nobackup       "no backup files
set nowritebackup  "only in case you don't want a backup file while editing
set noswapfile
set backspace=indent,eol,start
set tags=./.tags;
set mouse=a
" search 
set hlsearch
set incsearch
" indentation
set autoindent
set cindent
set shiftwidth=2
set expandtab
set tabstop=2

" remove bells for vim errors
set noeb
set vb t_vb=

" Buffers 
" Allow switching buffer without saving
set hidden
" F5 - previous buffer
map <F5> :bp<cr>
vmap <F5> <esc>:bp<cr>
imap <F5> <esc>:bp<cr>
" F6 - next buffer
map <F6> :bn<cr>
vmap <F6> <esc>:bn<cr>
imap <F6> <esc>:bn<cr>

" Moving lines
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" NerdTree
map <F2> :NERDTreeToggle<CR>
map <F3> :NERDTreeFind<CR>

" Colorcheme
set t_Co=256
colorscheme molokai
hi MatchParen      ctermfg=208 ctermbg=233 cterm=underline
"let g:rehash256 = 1
"let g:molokai_original = 1

" CtrlP
let g:ctrlp_by_filename=1 

nnoremap <C-b> <esc> :CtrlPBuffer <cr>
inoremap <C-b> <esc> :CtrlPBuffer <cr>
vnoremap <C-b> <esc> :CtrlPBuffer <cr>

" Track the engine.
function! g:UltiSnips_Complete()
        call UltiSnips#ExpandSnippet()
        if g:ulti_expand_res == 0
                if pumvisible()
                        return "\<C-n>"
                else
                        call UltiSnips#JumpForwards()
                        if g:ulti_jump_forwards_res == 0
                                return "\<TAB>"
                        endif
                endif
        endif
        return ""
endfunction
au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"

" UltiSnipss cofiguration
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" workaround for https://github.com/mdreves/vim-scaladoc/issues/1
fun! OpenScalaDoc( arg  )
  call scaladoc#Search(a:arg)
endf
command! -nargs=+ ScalaDoc call OpenScalaDoc('<f-args>')
autocmd FileType scala nnoremap K :call OpenScalaDoc(expand("<cword>"))<CR>

" Vim Airline
let g:airline#extensions#tabline#enabled = 1

" Ctrl-S save
noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>

"smart indent when entering insert mode with i on empty lines
function! IndentWithI()
  if len(getline('.')) == 0
    return "\"_cc"
  else
    return "i"
  endif
endfunction
nnoremap <expr> i IndentWithI()

" Vim Lexical configuration
augroup lexical
  autocmd!
  autocmd FileType markdown,mkd call lexical#init()
  autocmd FileType textile call lexical#init()
  autocmd FileType text call lexical#init({ 'spell': 0  })
augroup END

" EnsimeVim ctrl-click navigation
noremap <C-RightMouse> <esc> :EnDeclaration <cr>
autocmd BufWritePost *.scala :EnTypeCheck

