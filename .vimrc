set nocompatible

filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'
" for all of Vim
Plugin 'flazz/vim-colorschemes'
Plugin 'altercation/vim-colors-solarized'

Plugin 'rking/ag.vim'
 "really cool multicursor plugin for vim:
Plugin 'terryma/vim-multiple-cursors'
"qml highlighting:
Plugin 'crucerucalin/qml.vim'
" is not used now, check if it still required
Plugin 'Lokaltog/vim-easymotion'
" best ever vim git plugin
Plugin 'tpope/vim-fugitive'

Plugin 'Valloric/YouCompleteMe'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'peterhoeg/vim-qml'

" try to extend js autocomplete
"Plugin 'ternjs/tern_for_vim'

call vundle#end()

filetype plugin indent on
syntax enable

 set exrc
 set secure

 set shell=zsh

 set number
 set nowrap
 set tabstop=4
 set softtabstop=4
 set shiftwidth=4
 set expandtab
 set noswapfile
 set incsearch
 set hlsearch

 set mouse=a

 set foldmethod=syntax
 set foldlevelstart=99
 "enable folding for XML, where it,s disabled by default
 "I temporarily disable this when I have to edit large XML files
 "maby Konfekt/FastFold can help me with this problem.
let g:xml_syntax_folding=1

"class highliting:
let g:cpp_class_scope_highlight = 1

set showcmd

set laststatus=2

" set local spellcheck for all commmit messages
autocmd FileType gitcommit setlocal spell

" set sql highlight for files with .dump extension
autocmd BufNewFile,BufRead *.dump se ft=sql

"Resize splits when the window is resized:
au VimResized * exe "normal! \c-w="

"Color scheme:
"colorscheme BlackSea
"colorscheme herald
colorscheme molokai

let g:molokai_original = 0
let g:rehash256 = 1


let g:etpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1

set t_Co=256

set colorcolumn=110
augroup CursorLine

au!
	au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
	au WinLeave * setlocal nocursorline
augroup END

highlight ColorComumn ctermbg=darkgray

set guifont=*
"set guifont=Monospace:h9

"let g:ctrlk_clang_library_path="/home/ydederkal/.vim/bundle/YouCompleteMe/third_party/ycmd/"
"nmap <F3> :call GetCtrlKState()<CR>
"nmap <C-k> :call CtrlKNavigateSymbols()<CR>
"nmap <F2> :call CtrlKGoToDefinition()<CR>
"nmap <F12> :call CtrlKGetReferences()<CR>

"show whitespace and tabs
set list

" use prettier characters to represent whitespace and long lines in list mode
" " some more-indicative but too-wide eol characters: ↩, ↲, ⬎, or ⤸
set listchars=eol:¬,tab:▸\ ,trail:·,extends:),precedes:(,conceal:…,nbsp:·


"******** NERD Tree extension setup *****
"excluding files .o
let NERDTreeIgnore=['\.o$']

" ******** YouCompleteMe configuration: ******

let g:ycm_server_keep_logfiles = 1
let g:ycm_server_use_vim_stdout = 1
let g:ycm_server_log_level = 'debug'
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_server_python_interpreter = "/usr/bin/python2.7"
" ******** YouCompleteMe end of configuration ******

" ****** Airline extension setup ******
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" ****** end of  Airline extension setup ******

let mapleader = ","

" ****** easy motion plugin setup ******
" looks like it is almoust unuset now
let g:EasyMotion_do_mapping = 0 "Disable default mappings
" ****** end of easy motion plugin setup ******

" ****** Ctags setup ****************
map <F4> [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

" ****** Header <---> Source file switcher *****************
map <F3> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

" ****** map NERDTree open****
"nnoremap <F5> :NERDTreeToggle<CR>
nnoremap <F5> :NERDTreeToggle<CR>
map <leader>r :NERDTreeFind<cr>

" ***** map leader q to close current buffer without closing current splitted
" window:
map <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>
" ***************

" ****** configure git NERDTree plugin****
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

" ****** map tab switch ****
nmap gl <C-w>l
nmap gh <C-w>h
nmap gj <C-w>j
nmap gk <C-w>k
" ****** end of tab switch remap ****
" ****** buffer switching for tab after :b and open buffer menu on F10
set wildchar=<Tab> wildmenu wildmode=full
set wildcharm=<C-Z>
" ****** buffer switching
" ****** CtrlP  configuration ****
" custom key combination:
let g:ctrlp_map = '<c-p>'
" custom command combination:
let g:ctrlp_cmd = 'CtrlP /home/ydederkal/ntg6master'

let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_max_depth = 50
let g:ctrlp_cache_dir = '/home/ydederkal/.cache/ctrlp'
let g:ctrlp_show_hidden = 0
let g:ctrlp_max_files=0
" set ctrlp to ignore files.
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

map <C-b> :CtrlPBuffer<CR>
" ***** ** *** ***

" ***** copy selected text using Ctrl-L
" Escape special characters in a string for exact matching.
" This is useful to copying strings from the file to the search tool
" Based on this - http://peterodding.com/code/vim/profile/autoload/xolox/escape.vim
function! EscapeString (string)
  let string=a:string
  " Escape regex characters
  let string = escape(string, '^$.*\/~[]')
  " Escape the line endings
  let string = substitute(string, '\n', '\\n', 'g')
  return string
endfunction

" Get the current visual block for search and replaces
" This function passed the visual block through a string escape function
" Based on this - http://stackoverflow.com/questions/676600/vim-replace-selected-text/677918#677918
function! GetVisual() range
  " Save the current register and clipboard
  let reg_save = getreg('"')
  let regtype_save = getregtype('"')
  let cb_save = &clipboard
  set clipboard&

  " Put the current visual selection in the " register
  normal! ""gvy
  let selection = getreg('"')

  " Put the saved registers and clipboards back
  call setreg('"', reg_save, regtype_save)
  let &clipboard = cb_save

  "Escape any special characters in the selection
  let escaped_selection = EscapeString(selection)

  return escaped_selection
endfunction

" Start the find and replace command across the entire file
vmap <leader>z <Esc>:%s/<c-r>=GetVisual()<cr>/

" When in visual mode,
" before command mode is entered by using :
" Put the contents of any selected text into
" the default register
" leave the text highlighted.
" Based on ierton - http://stackoverflow.com/questions/4878980/vim-insert-selected-text-into-command-line
vnoremap : "pygv:

"Map ctrl-L to paste escaped contents of default register in command mode
" Based on bryan kennedy - http://stackoverflow.com/questions/676600/vim-search-and-replace-selected-text
cnoremap <C-L> <c-r>=GetVisual()<cr>

set noshowmode
