" Calling all plugins!
" Pathogen vim plugin loading - https://github.com/tpope/vim-pathogen
"
call pathogen#infect('bundle/{}', '~/.dotfiles/vim/bundle/{}')
call pathogen#helptags()

set guioptions=am         " No toolbar in the gui; must be first in .vimrc.
behave xterm

set guifont=Consolas:h9   " encoding settings for gVim
set encoding=utf-8
set fileencoding=utf-8

set nocompatible          " No compatibility with vi.
filetype on               " Recognize syntax by file extension.
filetype indent on        " Check for indent file.
filetype plugin on        " Allow plugins to be loaded by file type.
syntax on                 " Syntax highlighting.
let php_folding=1

set ai                    " Auto indent
set si                    " smart indenting

set nowritebackup
set nobackup
set noswapfile

set autowrite             " Write before executing the 'make' command.
set background=dark       " Background light, so foreground not bold.
set backspace=2           " Allow <BS> to go past last insert.

set expandtab             " Expand tabs with spaces.
set shiftwidth=3          " >> and << shift 3 spaces.
set softtabstop=3         " See spaces as tabs.
set tabstop=3             " <Tab> move three characters.

set nofoldenable          " Disable folds; toggle with zi.
set gdefault              " Assume :s uses /g.
set ignorecase            " Ignore case in regular expressions
set incsearch             " Immediately highlight search matches.
set modeline              " Check for a modeline.
set noerrorbells          " No beeps on errors.
set nohls                 " Don't highlight all regex matches.
set nowrap                " Don't soft wrap.
set number                " Display line numbers.
set ruler                 " Display row, column and % of document.
set scrolloff=6           " Keep min of 6 lines above/below cursor.
set showcmd               " Show partial commands in the status line.
set showmatch             " Show matching () {} etc..
set showmode              " Show current mode.
set smartcase             " Searches are case-sensitive if caps used.
set textwidth=79          " Hard wrap at 79 characters.
set virtualedit=block     " Allow the cursor to go where there's no char.
set wildmode=longest,list " Tab completion works like bash.

set keywordprg=pman       " ?

au BufNewFile,BufRead *.phtml set filetype=php

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set some configuration variables.
let loaded_matchparen=0   " do automatic bracket highlighting.
let mapleader="," " Remap <Leader> to ,

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Easy Motion Configuration
let g:EasyMotion_leader_key = ',m'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CtrlP file search config https://github.com/kien/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" When invoked, unless a starting directory is specified,  CtrlP will set its local working directory according to this variable:
" 'c' - the directory of the current file.
" 'r' - the nearest ancestor that contains one of these directories or files: " .git .hg .svn .bzr _darcs
" 'a' - like c, but only if the current working directory outside of CtrlP is " not a direct ancestor of the directory of the current file.
" 0 or '' (empty string) - disable this feature.
let g:ctrlp_working_path_mode = 'ra'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Formatting settings

" t: Auto-wrap text using textwidth. (default)
" c: Auto-wrap comments; insert comment leader. (default)
" q: Allow formatting of comments with "gq". (default)
" r: Insert comment leader after hitting <Enter>.
" o: Insert comment leader after hitting 'o' or 'O' in command mode.
" n: Auto-format lists, wrapping to text *after* the list bullet char.
" l: Don't auto-wrap if a line is already longer than textwidth.
set formatoptions+=ronlq

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Command mode cartography

" Make Q reformat text.
noremap Q gq

" Set autoformat to <Leader> f
noremap <Leader>f :Autoformat<CR><CR>

" Toggle paste mode.
noremap <Leader>p :set paste!<CR>

" Open the file under the cursor in a new tab.
noremap <Leader>ot <C-W>gf

" Toggle highlighting of the last search.
noremap <Leader>h :set hlsearch! hlsearch?<CR>

" Open a scratch buffer.
noremap <Leader>s :Scratch<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Insert mode cartography

" Set up dictionary completion.
set dictionary+=~/.vim/dictionary/english-freq
set complete+=k

" Make C-s write the buffer and return to insert mode when applicable
inoremap <C-s> <C-O>:w<CR>
nnoremap <C-s> :w<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Highlighting

let g:solarized_termcolors=256
syntax enable

"==========================================
" This should automatically be determined from the terminal type...
set t_Co=256
set background=dark
colorscheme solarized

"==========================================
" Syntastic options : https://github.com/scrooloose/syntastic/

let g:syntastic_check_on_open=1

"==========================================
" Restore the cursor when we can.

function! RestoreCursor()
    if line("'\"") <= line("$")
        normal! g`"
        normal! zz
    endif
endfunction
autocmd BufWinEnter * call RestoreCursor()

"==========================================
" My Customizations
"==========================================

set path=~/Code/**

"==========================================
" Reread configuration of Vim if .vimrc is saved {{{
augroup VimConfig
  au!
  autocmd BufWritePost ~/.vimrc       so ~/.vimrc
  autocmd BufWritePost _vimrc         so ~/_vimrc
  autocmd BufWritePost vimrc          so ~/.vimrc
augroup END
" }}}

"==========================================
" Use hjkl in insert mode
imap <C-h> <Left>
imap <C-j> <Down>
imap <C-k> <Up>
imap <C-l> <Right>

"==========================================
" auto-insert second braces and parynthesis
inoremap {<CR> {<CR>}<Esc>O
inoremap ({<CR> ({<CR>});<Esc>O
inoremap <<<<CR> <<<EOT<CR>EOT;<Esc>O<C-TAB><C-TAB><C-TAB>
set cpoptions+=$ "show dollar sign at end of text to be changed

"==========================================
" Allow easy toggling of spaces / tabs mode
nnoremap <C-t><C-t> :set invexpandtab<CR>

"==========================================
"Highlights lines that are greater than 80 columns
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength '\%80v.\+'
highlight ColorColumn ctermbg=DarkRed
set colorcolumn=80

"==========================================
" Create simple toggles for line numbers, paste mode, and word wrap.
nnoremap <C-N><C-N> :set invnumber<CR>
nnoremap <C-p><C-p> :set invpaste<CR>
nnoremap <C-w><C-w> :set invwrap<CR>

"==========================================
" Use C-hjkl in to change windows
nnoremap <C-h> <C-w><Left>
nnoremap <C-j> <C-w><Down>
nnoremap <C-k> <C-w><Up>
nnoremap <C-l> <C-w><Right>

"==========================================
" vim-powerline: https://github.com/Lokaltog/vim-powerline
let g:Powerline_theme="solarized"
let g:Powerline_symbols="fancy"

" show status line even where there is only one window
set laststatus=2

"==========================================
" vim-indent-guides : 
"hi IndentGuidesOdd  ctermbg=black
"hi IndentGuidesEven ctermbg=darkgrey
"hi IndentGuidesOdd  ctermbg=white
"hi IndentGuidesEven ctermbg=lightgrey

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd InsertEnter * syn clear EOLWS | syn match EOLWS excludenl /\s\+\%#\@!$/
autocmd InsertLeave * syn clear EOLWS | syn match EOLWS excludenl /\s\+$/
highlight EOLWS ctermbg=red guibg=red

"==========================================
" Set less syntax
nnoremap <Leader>m :w <BAR> !lessc % > %:t:r.css<CR><space>

" Hide csslint options
let g:syntastic_csslint_options = "--warnings=none"

"==========================================
" Mouse Options

" Enable mouse scrolling in all modes!
set mouse=a

"==========================================
" Splitjoin config

nmap sj :SplitjoinSplit<CR>
nmap sk :SplitjoinJoin<CR>

"==========================================
" From: https://gist.github.com/3882918
" Author: Marc Zych
nnoremap <silent> <C-o> :call FindFile()<CR>

function! FindFile()
   " Get the word under cursor.
   let cursorWord = expand("<cword>")
   " Get the current file name and keep only the extension.
   let currentFile = expand("%")
   let extPos = stridx(currentFile, ".")

   " Append an extension only if the current file has an extension.
   if extPos != -1
      let extension = strpart(currentFile, extPos)
   else
      let extension = ""
   endif

   " Construct the file name.
   let fileName = cursorWord.extension

   " Open the file in the current buffer.
   execute "find ".fileName
endfunction


"============================================
" PDV PHP Documentor setup
" 
let g:pdv_template_dir = $HOME . "/.vim/bundle/pdv/templates_snip"
nnoremap <buffer> <C-i> :call pdv#DocumentWithSnip()<CR>


autocmd FileType phtml,less EmmetInstall

