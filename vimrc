set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'wincent/command-t'
Plugin 'ervandew/supertab'
Plugin 'tomtom/tcomment_vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-cucumber'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-unimpaired'
Plugin 'vim-ruby/vim-ruby'
Plugin 'vim-scripts/ack.vim'
Plugin 'slim-template/vim-slim.git'
Plugin 'godlygeek/tabular'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
" Plugin 'Shougo/neocomplete'
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'
" Plugin 'garbas/vim-snipmate'
" Plugin 'honza/vim-snippets'
Plugin 'junegunn/vim-emoji' 
Plugin 'scrooloose/nerdtree'

call vundle#end()

runtime macros/matchit.vim

syntax on                 " Enable syntax highlighting
filetype plugin indent on " Enable filetype-specific indenting and plugins

augroup myvimrc
  au!
  au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

let mapleader = ","

" disable arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" adjust viewports to the same size
map <Leader>= <C-w>=
nnoremap <leader>a :Ack
nnoremap <leader>A :Ack <c-r><c-w><CR>
vmap <Leader>b :b#<CR>
map <Leader>bb :!bundle install<CR>
vmap <Leader>bed "td?describe<CR>obed<tab><esc>"tpkdd/end<CR>o<esc>:nohl<CR>
" cleanup (formatting of) code:
nmap <leader>c ggVG= 
map <Leader>cc :!cucumber --drb %<CR>
" cd to current file
map <Leader>cd :cd %:p:h<CR>
map <Leader>cu :Tabularize /\|<CR>
map <Leader>co ggVG"*y
map <Leader>ct :w<CR>:call RunCurrentTest()<CR>
map <Leader>ctf :CommandTFlush<CR>:CommandT<CR>
map <leader>d :NERDTreeToggle %<CR>
map <Leader>dr :e ~/Dropbox<CR>
map <Leader>ec :e ~/code/
nnoremap <Leader>g :diffget<CR>
map <Leader>gac :Gcommit -m -a ""<LEFT>
map <Leader>gc :Gcommit -m ""<LEFT>
map <Leader>gs :Gstatus<CR>
map <Leader>gw :!git add . && git commit -m 'WIP' && git push<CR>
map <Leader>f :call OpenFactoryFile()<CR>
map <Leader>fix :cnoremap % %<CR>
map <leader>h <C-w>h
map <leader>j <C-w>j
map <leader>k <C-w>k
map <leader>l <C-w>l
map <Leader>m :Rmodel 
map <Leader>nb :sp ~/Dropbox/notes/bash-notes.txt<CR>
map <Leader>nc :sp ~/Dropbox/notes/coding-notes.txt<CR>
map <Leader>ng :sp ~/Dropbox/notes/git.txt<CR>
map <Leader>ni :sp ~/Dropbox/notes/ilox.txt<CR>
map <Leader>nn :sp ~/Dropbox/notes/programming_notes.txt<CR>
map <Leader>np :sp ~/Dropbox/notes/project-notes.txt<CR>
map <Leader>ns :sp ~/Dropbox/notes/splunk_notes.txt<CR>
map <Leader>nt :sp ~/Dropbox/notes/todo.txt<CR>
map <Leader>nu :sp ~/Dropbox/notes/troubleshooting-notes.txt<CR>
map <Leader>nv :sp ~/Dropbox/notes/vimtips.txt<CR>
map <Leader>o :call RunCurrentLineInTest()<CR>
nnoremap <Leader>p :diffput<CR> 
map <Leader>pa :set paste<CR>o<esc>"*]p:set nopaste<CR>
map <Leader>ppj :.!python -m json.tool<CR>
map <Leader>ra :%s/
map <Leader>rd :!bundle exec rspec % --format documentation<CR>
map <Leader>rs :vsp <C-r>#<CR><C-w>w
map <Leader>rt q:?!ruby<CR><CR>
map <Leader>rw :%s/\s\+$//<CR>:w<CR>
map <leader>s :split<CR>
map <Leader>sc :sp db/schema.rb<CR>
map <Leader>sg :sp<CR>:grep 
map <Leader>sj :call OpenJasmineSpecInBrowser()<CR>
map <Leader>sm :RSmodel 
map <Leader>sp yss<p>
" map <Leader>sn :vs ~/.vim/bundle/vim-snippets/snippets/ruby.snippets<CR>
" map <Leader>sng :vs ~/.vim/bundle/vim-snippets/snippets/coffee/angular_coffee.snippets<CR>
" map <Leader>sns :vs ~/.vim/bundle/vim-snippets/snippets/sml.snippets<CR>
map <Leader>so :so %<CR>
map <Leader>sq j<c-v>}klllcs<esc>:wq<CR>
map <Leader>ss ds)i <esc>:w<CR>
map <Leader>st :!ruby -Itest % -n "//"<left><left>
map <Leader>su :RSunittest 
map <Leader>sv :RSview 
map <Leader>t :CommandT<CR>
" map <Leader>t :w<CR>:!rake cucumber:controller_wip<CR>
map <Leader>tr !touch tmp/restart.txt
nnoremap <Leader>u :diffupdate<CR>
map <Leader>ut :Runittest<CR>
map <leader>v :vsplit<CR>
map <Leader>vc :RVcontroller<CR>
map <Leader>vf :RVfunctional<CR>
map <Leader>vg :vsp<CR>:grep 
map <Leader>vi :tabe ~/.vimrc<CR>
map <Leader>vm :RVmodel<CR>
map <Leader>vu :RVunittest<CR>
map <Leader>vv :RVview<CR>
map <Leader>w <C-w>w
map <Leader>x :exec getline(".")<CR>
map <Leader>y :!rspec --drb %<CR>

" Edit another file in the same directory as the current file
" uses expression to extract path from current file's path
map <Leader>e :e <C-R>=expand("%:p:h") . '/'<CR>
map <Leader>s :split <C-R>=expand("%:p:h") . '/'<CR>
map <Leader>v :vnew <C-R>=expand("%:p:h") . '/'<CR>

map <C-h> :nohl<CR>
imap <C-l> :<Space>
map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>
map <C-x> <C-w>c
map <C-n> :cn<CR>
map <C-p> :cp<CR>

map <F4> :exec "Ack " . expand("<cword>")<CR>

" Emacs-like beginning and end of line.
imap <c-e> <c-o>$
imap <c-a> <c-o>^

" remove trailing whitespace
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>:retab<CR>

vnoremap < <gv
vnoremap > >gv


set backspace=indent,eol,start " allow backspacing over everything in insert mode
set history=500		" keep 500 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set autoindent
set showmatch
set nowrap
set backupdir=~/.tmp
set directory=~/.tmp " Don't clutter my dirs up with swp and tmp files
set autoread
set wmh=0
set viminfo+=!
set guioptions-=T
" set guifont=Triskweline_10:h10
set shiftwidth=2 
set tabstop=2 
set expandtab
set smarttab
set noincsearch
set ignorecase smartcase
set laststatus=2  " Always show status line.
"set relativenumber
set number
set autoindent " always set autoindenting on
set bg=light

" Set the tag file search order
set tags=./tags;

" Use _ as a word-separator
" set iskeyword-=_

" Use Silver Searcher instead of grep
set grepprg=ag

" Get rid of the delay when hitting esc!
set noesckeys

" Fuzzy finder: ignore stuff that can't be opened, and generated files
" let g:fuzzy_ignore = "*.png;*.PNG;*.JPG;*.jpg;*.GIF;*.gif;vendor/**;coverage/**;tmp/**;rdoc/**"

" Set gutter background to black
highlight SignColumn ctermbg=black

" Make the omnicomplete text readable
:highlight PmenuSel ctermfg=black

" Highlight the status line
highlight StatusLine ctermfg=blue ctermbg=yellow

" Format xml files
au FileType xml exe ":silent 1,$!xmllint --format --recover - 2>/dev/null" 

set shiftround " When at 3 spaces and I hit >>, go to 4, not 5.

set nofoldenable " Say no to code folding...

command! Q q " Bind :Q to :q
command! Qall qall 


" Disable Ex mode
map Q <Nop>

" Disable K looking stuff up
map K <Nop>

" When loading text files, wrap them and don't split up words.
au BufNewFile,BufRead *.txt setlocal wrap 
au BufNewFile,BufRead *.txt setlocal lbr

" Better? completion on command line
set wildmenu
" What to do when I press 'wildchar'. Worth tweaking to see what feels right.
set wildmode=list:full

" (Hopefully) removes the delay when hitting esc in insert mode
set noesckeys
set ttimeout
set ttimeoutlen=1

" Turn on spell-checking in markdown and text.
" au BufRead,BufNewFile *.md,*.txt setlocal spell

" Merge a tab into a split in the previous window
function! MergeTabs()
  if tabpagenr() == 1
    return
  endif
  let bufferName = bufname("%")
  if tabpagenr("$") == tabpagenr()
    close!
  else
    close!
    tabprev
  endif
  split
  execute "buffer " . bufferName
endfunction

nmap <C-W>u :call MergeTabs()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Test-running stuff
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RunCurrentTest()
  let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\|_test.rb\)$') != -1
  if in_test_file
    call SetTestFile()

    if match(expand('%'), '\.feature$') != -1
      call SetTestRunner("!cucumber")
      exec g:bjo_test_runner g:bjo_test_file
    elseif match(expand('%'), '_spec\.rb$') != -1
      call SetTestRunner("!rspec")
      exec g:bjo_test_runner g:bjo_test_file
    else
      call SetTestRunner("!ruby -Itest")
      exec g:bjo_test_runner g:bjo_test_file
    endif
  else
    exec g:bjo_test_runner g:bjo_test_file
  endif
endfunction

function! SetTestRunner(runner)
  let g:bjo_test_runner=a:runner
endfunction

function! RunCurrentLineInTest()
  let in_test_file = match(expand("%"), '\(.feature\|_steps.rb\|_spec.rb\|_test.rb\)$') != -1
  if in_test_file
    call SetTestFileWithLine()
  end

  " exec "!rspec" g:bjo_test_file . ":" . g:bjo_test_file_line
  exec "!cucumber" g:bjo_test_file . ":" . g:bjo_test_file_line
endfunction

function! SetTestFile()
  let g:bjo_test_file=@%
endfunction

function! SetTestFileWithLine()
  let g:bjo_test_file=@%
  let g:bjo_test_file_line=line(".")
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " show pesky invisible characters
" set listchars=nbsp:¬,eol:¶,tab:>-,extends:»,precedes:«,trail:•,trail:~,extends:>,precedes:<
" set list

" Let's be reasonable, shall we?
nmap k gk
nmap j gj


"autosave all when focus is lost (and ignore warnings from untitled buffers)
au FocusLost * silent! wa

" Don't add the comment prefix when I hit enter or o/O on a comment line.
set formatoptions-=or

function! OpenJasmineSpecInBrowser()
  let filename = expand('%')
  "                  substitute(exprsson, pattern,            substitution,    flags)
  let url_fragment = substitute(filename, "spec/javascripts", "evergreen/run", "")
  let host_fragment = "http://localhost:3001/"
  let url = host_fragment . url_fragment
  silent exec "!open ~/bin/chrome" url
endfunction

set statusline+=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

let g:CommandTMaxHeight=30
" let g:commandtmatchwindowattop=1

" Don't wait so long for the next keypress (particularly in ambigious Leader situations.
set timeoutlen=500

" Don't go past 100 chars on search app:
" autocmd BufNewFile,BufRead /Users/bolpin/src/unisporkal/search/*.rb set colorcolumn=100

" Remove trailing whitespace on save for ruby files.
au BufWritePre *.rb :%s/\s\+$//e

function! OpenFactoryFile()
  if filereadable("test/factories.rb")
    execute ":sp test/factories.rb"
  else
    execute ":sp spec/factories.rb"
  end
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RENAME CURRENT FILE (thanks Gary Bernhardt)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <Leader>n :call RenameFile()<CR>

syntax enable
colorscheme vividchalk

" ========================================================================
" Cucumber tables.vim 
" ========================================================================
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction


" ========================================================================
" Stuff not set by me
" ========================================================================

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  colorscheme vividchalk
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  augroup END

endif " has("autocmd")

" ========================================================================
" More stuff set by me
" ========================================================================

highlight Search guibg=DarkRed ctermbg=DarkRed


