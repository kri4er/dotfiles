set nocompatible

filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

"let Vundle manage Vundle
Plugin 'gmarik/vundle'

"schemas:
" for all of Vim
 Plugin 'flazz/vim-colorschemes'
 Plugin 'altercation/vim-colors-solarized'

 Plugin 'kien/ctrlp.vim'
 Plugin 'rking/ag.vim'

 "really cool multicursor plugin for vim:
 Plugin 'terryma/vim-multiple-cursors'

 Plugin 'Lokaltog/vim-easymotion'
 Plugin 'Valloric/YouCompleteMe'
 Plugin 'bling/vim-airline'
 Plugin 'scrooloose/nerdtree'
 Plugin 'octol/vim-cpp-enhanced-highlight'
 "syntastic below is not recomended for Windows
 "Disable if it pops up to many cmd windows
 "Plugin 'scrooloose/syntastic'

 filetype plugin indent on
 syntax enable

 set exrc
 set secure

 set number
 set nowrap
 set tabstop=4
 set softtabstop=4
 set shiftwidth=4
 set noexpandtab
 set noswapfile

 set mouse=a

 set foldmethod=syntax
 set foldlevelstart=99
 "enable folding for XML, where it,s disabled by default
 "I temporarily disable this when I have to edit large XML files
 "maby Konfekt/FastFold can help me with this problem.
 let g:xml_syntax_folding=1
"maby Konfekt/FastFold can help me with this problem.
let g:xml_syntax_folding=1

"class highliting:
let g:cpp_class_scope_highlight = 1

set showcmd

set laststatus=2

"Resize splits when the window is resized:
au VimResized * exe "normal! \c-w="

"Color scheme:
"colorscheme herald
colorscheme molokai

let g:molokai_original = 1
let g:rehash256 = 1


let g:cpp_class_scope_highlight = 1
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

let g:ctrlk_clang_library_path="/home/kri4er/.vim/bundle/YouCompleteMe/third_party/ycmd/"
nmap <F3> :call GetCtrlKState()<CR>
nmap <C-k> :call CtrlKNavigateSymbols()<CR>
nmap <F2> :call CtrlKGoToDefinition()<CR>
nmap <F12> :call CtrlKGetReferences()<CR>

"show whitespace and tabs
set list

" use prettier characters to represent whitespace and long lines in list mode
" " some more-indicative but too-wide eol characters: ↩, ↲, ⬎, or ⤸
set listchars=eol:¬,tab:▸\ ,trail:·,extends:),precedes:(,conceal:…,nbsp:·


"******** NERD Tree extension setup *****
"excluding files .o
let NERDTreeIgnore=['\.o$']

" ******** YouCompleteMe configuration: ******
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:ycm_collect_identifiers_from_tags_files = 1
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
let g:EasyMotion_do_mapping = 0 "Disable default mappings
" ****** end of easy motion plugin setup ******

" ****** Ctags setup ****************
map <F4> [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>
" ****** Ctags setup *****************

" ****** map NERDTree open****

nnoremap <F5> :NERDTreeToggle<CR>

" ****** map tab switch ****
nmap gt <C-w>l
nmap gT <C-w>h
nmap gj <C-w>j
nmap gk <C-w>k
" ****** end of tab switch remap ****

set noshowmode
