syntax on
set expandtab
set ts=2 sw=2 sws=2
set autoindent nosmartindent nocindent

filetype plugin on
filetype indent off

set clipboard=unnamed

set backspace=indent,eol,start " allow backspacing over everything in insert mode
set backup " keep backup file after overwriting a file
set backupdir=~/.vim_backups " directory for the backups

:map <C-a> ^
:map <C-e> $
:cmap <C-a> <home>
:cmap <C-e> <end>
:imap <C-e> <ESC>$i<right>
:imap <C-a> <ESC>^i

"""""""""""""""""""""""""""""""""""""""""""""
" from /usr/share/vim/vim72/vimrc_example.vim

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
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
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif
" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Load pathogen for managing all those pesky plugins.
" Load this first so ftdetect in bundles works properly.
call pathogen#runtime_append_all_bundles() 

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

syntax on               " enable syntax highlighting
set history=50          " keep 50 lines of command line history
set showcmd             " display incomplete commands
set incsearch           " do incremental searching
set hlsearch            " highlight search results
set mouse=a             " enable the mouse
set expandtab           " always use spaces not tabs
set ts=2 sw=2 sts=2     " default to 2 space tabs
set autoindent nosmartindent nocindent  " go for simple autoindenting
set hidden              " unload any buffer that's hidden
set wildmode=list:longest  " list options when completing on the command line

" Set up the status line
set laststatus=2        " Always show it.
set statusline=%([%M%R%H%W]\ \ %)%l/%L\ \ %f%=%{&filetype}\ \ %c

" Put swap files in /tmp, and don't keep backups.
set dir=/tmp
set nobackup

" Set up folding.
set foldenable         " enable code folding
set foldmethod=syntax  " use syntax for folding
set foldlevelstart=99  " open all folds by default
set foldtext=getline(v:foldstart)
set fillchars=fold:\ 

if has("gui_macvim")
  set mousehide                   " Hide the mouse when typing text.
  set guioptions=egm              " Show tabs, hide toolbar and scrollbar.
  set fuoptions=maxvert,maxhorz   " Go to full width and height in full screen mode.

  set gfn=Inconsolata:h15         " Inconsolata 15px for the font
  set linespace=0                 " 0 pixels between lines

  colorscheme railscasts

  " Leave insert mode when vim loses focus. Doesn't work. :(
  autocmd FocusLost * :stopinsert

  " Better colours for folding.
  highlight Folded guifg=#EEEEEE guibg=#333333
endif


" Plugin Configuration
" --------------------

" Stop Lusty Juggler complaining when we use the system vim.
let g:LustyJugglerSuppressRubyWarning = 1

" Show relative paths in bufexplorer.
let g:bufExplorerShowRelativePath=1
" Hide the default help in bufexplorer.
let g:bufExplorerDefaultHelp=0

" Let single clicks open file and directories.
let g:NERDTreeMouseMode=3
" Close NERDTree after opening a file.
let g:NERDTreeQuitOnOpen=1


" Custom Key Mappings
" -------------------

" Disable the F1 key (which normally opens help) coz I hit it accidentally.
noremap <F1> <nop>

" noremap ,a :BufExplorer<CR>
noremap ,a :LustyBufferExplorer<CR>
noremap ,f :LustyFilesystemExplorer<CR>
noremap ,r :LustyFilesystemExplorerFromHere<CR>
noremap ,t :CommandT<CR>

" Use CTRL-J and CTRL-K to skip forward and back through functions.
map <C-K> [m
map <C-J> ]m

" Use CTRL-N and CTRL-P to skip forward and back through the quickfix list.
noremap <C-P> :cp<CR>
noremap <C-N> :cn<CR>

" Use CTRL-A to re-align ruby, SQL, and cucumber in visual mode.
vnoremap <C-A> !align-ruby<CR>

" Reselect the visual area when changing indenting in visual mode.
vnoremap < <gv
vnoremap > >gv

" Don't use Ex mode, use Q for formatting.
noremap Q gq
" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>


" Filetype Handling
" -----------------

" Enable file type detection, but disable smart indenting.
filetype plugin on
filetype indent off

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcCommands
autocmd!

autocmd BufRead,BufNewFile *.pde  set filetype=cpp
autocmd BufRead,BufNewFile *.ncss set filetype=css

autocmd FileType text       setlocal textwidth=78
autocmd FileType html       setlocal ts=2 sw=2 sts=2
autocmd FileType xhtml      setlocal ts=2 sw=2 sts=2
autocmd FileType css        setlocal ts=2 sw=2 sts=2
autocmd FileType javascript setlocal ts=2 sw=2 sts=2
autocmd FileType cpp        setlocal ts=2 sw=2 sts=2
autocmd FileType ruby       setlocal ts=2 sw=2 sts=2
autocmd FileType eruby      setlocal ts=2 sw=2 sts=2
autocmd FileType cucumber   setlocal ts=2 sw=2 sts=2
autocmd FileType markdown   setlocal ts=4 sw=4 sts=4

augroup END

command! W :w

map <Leader>rt :!ctags --extra=+f -R *
