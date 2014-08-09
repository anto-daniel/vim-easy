set hidden
nnoremap ' `
nnoremap ` '
set history=1000
set so=7
set wildmenu
set wildmode=list:longest
set wildignore=*.o,*.fasl,*.pyc,*~
set ignorecase 
set smartcase
set title
set tags=tags;~/ 
""set clipboard=unnamedplus

set smartindent 
set tabstop=8
set expandtab
set shiftwidth=4
set softtabstop=4
"set mouse=a
"set runtimepath+=$HOME/.vim/vim-haml
syntax on
""colorscheme desert
"set background=dark
filetype plugin indent on
set modeline
set number
set ts=4
let g:js_indent_log = 1
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
filetype plugin on
au FileType php setl ofu=phpcomplete#CompletePHP
au FileType ruby,eruby setl ofu=rubycomplete#Complete
au FileType html,xhtml setl ofu=htmlcomplete#CompleteTags
au FileType c setl ofu=ccomplete#CompleteCpp
au FileType css setl ofu=csscomplete#CompleteCSS
"map <F7> mzgg=G`z<CR>
autocmd FileType python compiler pylint
let g:pylint_onwrite = 0
let g:pylint_show_rate = 0
let g:pylint_cwindow = 0
let g:pylint_signs = 1
let g:pylint_inline_highlight = 1
let g:pylint_conventions = 1
let g:pylint_warning = 1
""nnoremap \z :setlocal foldexpr=(getline(v:lnum)=~@/)?0:(getline(v:lnum-1)=~@/)\\|\\|(getline(v:lnum+1)=~@/)?1:2 foldmethod=expr foldlevel=0 foldcolumn=2<CR>

:map <C-a> GVgg
:map <C-n> :enew
:map <C-o> :e . <Enter>
:map <C-s> :w <Enter>
:map <C-c> y
:map <C-v> p
:map <C-x> d
:map <C-z> u
:map <C-t> :tabnew <Enter>
:map <C-i> >>
":map <C-w> :close <Enter>
":map <C-W> :q! <Enter>
:map <C-f> /
:map <F3> n
:map <C-h> :%s/
:map <S-t> vat
:map <S-T> vit
:map <S-{> vi{
:map <S-(> vi(
:map <S-[> vi[
:map <S-> v
set backspace=indent,eol,start
set whichwrap+=<,>,h,l
set hlsearch
set incsearch
set listchars=tab:>-,trail:·,eol:$
nmap <silent> <leader>s :set nolist!<CR>
:map f :foldopen <Enter>
:map F :foldclose <Enter>
set statusline=%<%f%<%{FileTime()}%<%h%m%r%=%-20.(line=%03l,col=%02c%V,totlin=%L%)\%h%m%r%=%-30(,BfNm=%n%Y%)\%P\*%=%{CurTime()}
"set rulerformat=%15(%c%V\ %p%%%)
set rulerformat=%<%f%<%{FileTime()}%<%h%m%r%=%-20.(line=%03l,col=%02c%V,totlin=%L%)\%h%m%r%=%-30(,BfNm=%n%Y%)\%P\*%=%{CurTime()}

function! FileTime()
  let ext=tolower(expand("%:e"))
  let fname=tolower(expand('%<'))
  let filename=fname . '.' . ext
  let msg=""
  let msg=msg." ".strftime("(Modified %b,%d %y %H:%M:%S)",getftime(filename))
  return msg
endfunction

function! CurTime()
  let ftime=""
  let ftime=ftime." ".strftime("%b,%d %y %H:%M:%S")
  return ftime
endfunction

inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}



inoremap        (  ()<Left>
inoremap <expr> )  strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"

inoremap        [  []<Left>
inoremap <expr> ]  strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"

inoremap <expr> ' strpart(getline('.'), col('.')-1, 1) == "\'" ? "\<Right>" : "\'\'\<Left>"
inoremap <expr> " strpart(getline('.'), col('.')-1, 1) == "\"" ? "\<Right>" : "\"\"\<Left>"


set nocompatible
 
" Show a status line
set laststatus=2
 
" Show the current cursor position
set ruler
 
" Enable syntax highlighting
syn on
" }}}
" Mouse {{{
" Send more characters for redraws
set ttyfast

" Enable mouse use in all modes
set mouse=a
 
" Set this to the name of your terminal that supports mouse codes.
" Must be one of: xterm, xterm2, netterm, dec, jsbterm, pterm
set ttymouse=xterm2
" }}}
" Disable arrow keys {{{
" noremap <Up> <NOP>
" inoremap <Down> <NOP>
" inoremap <Left> <NOP>
" inoremap <Right> <NOP>
" noremap <Up> <NOP>
" noremap <Down> <NOP>
" noremap <Left> <NOP>
" noremap <Right> <NOP>
" }}}:
:command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> -
execute pathogen#infect()


" IMPORTANT: Uncomment one of the following lines to force
" using 256 colors (or 88 colors) if your terminal supports it,
" but does not automatically use 256 colors by default.
"set t_Co=256
"set t_Co=88
""""if (&t_Co == 256 || &t_Co == 88) && !has('gui_running') &&
""""    \ filereadable(expand("$HOME/.vim/plugin/guicolorscheme.vim"))
  " Use the guicolorscheme plugin to makes 256-color or 88-color
  " terminal use GUI colors rather than cterm colors.
""""  runtime! plugin/guicolorscheme.vim
"  runtime! plugin/industry.vim
"  runtime! plugin/desert.vim
"  GuiColorScheme rastafari
""  GuiColorScheme industry
""""  GuiColorScheme github
"  GuiColorScheme desert
"""" else
  " For 8-color 16-color terminals or for gvim, just use the
  " regular :colorscheme command.
"  colorscheme rastafari
""""  colorscheme github
"  colorscheme desert
"""" endif

""colorscheme github
set term=xterm-256color
colorscheme codeschool 

command! -bar -range=% Reverse <line1>,<line2>g/^/m<line1>-1|nohl
command Sudowrite w ! sudo tee % 
command Noindent setl noai nocin nosi inde=
command DeleteEmptyLines :g/^$/d
