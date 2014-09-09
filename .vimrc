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
set clipboard=unnamedplus

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

set nocompatible
filetype off 
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
filetype plugin indent on
Bundle 'gmarik/vundle'
augroup vimrc_autocmds
    autocmd!
    autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python match Excess /\%120v.*/
    autocmd FileType python set nowrap
augroup END
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
"set guifont=PowerlineSymbols
let g:Powerline_symbols = 'fancy'
Bundle 'tpope/vim-fugitive'
set modeline
set number
set ts=4
let g:js_indent_log = 1
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
filetype plugin on
highlight ColorColumn ctermbg=233
au FileType php setl ofu=phpcomplete#CompletePHP
au FileType ruby,eruby setl ofu=rubycomplete#Complete
au FileType html,xhtml setl ofu=htmlcomplete#CompleteTags
au FileType c setl ofu=ccomplete#CompleteCpp
au FileType css setl ofu=csscomplete#CompleteCSS
map <F7> mzgg=G`z<CR>
autocmd FileType python compiler pylint
""let g:pylint_onwrite = 0 
""let g:pylint_show_rate = 0 
""let g:pylint_cwindow = 0
""let g:pylint_signs = 0
""let g:pylint_inline_highlight = 0
""let g:pylint_conventions = 0
""let g:pylint_warning = 0
""nnoremap \z :setlocal foldexpr=(getline(v:lnum)=~@/)?0:(getline(v:lnum-1)=~@/)\\|\\|(getline(v:lnum+1)=~@/)?1:2 foldmethod=expr foldlevel=0 foldcolumn=2<CR>

"vmap <C-Space> "ay
"nmap <C-Space> "aP
"imap <C-Space> <C-o>"ap
"nmap <C-c> "ayiw
"
"
"vmap <C-c> "py
"nmap <C-c> "pyiw
"vmap <C-p> "pp
"nmap <C-p> "pP
"imap <C-p> <Esc>"ppa"
"
"vmap <C-c> "*y
"
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
"":map <C-f> /
:map <F3> n
:map <C-h> :%s/
:map <S-t> vat
:map <S-T> vit
:map <S-{> vi{
:map <S-(> vi(
:map <S-[> vi[
:map <S-> v
":imap <C-V> "+gp
set backspace=indent,eol,start
set whichwrap+=<,>,h,l
set hlsearch
set incsearch
set listchars=tab:>-,trail:·,eol:$
nmap <silent> <leader>s :set nolist!<CR>
:map f :foldopen <Enter>
set autochdir
if has ('gui_running')
    highlight Pmenu guibg=#cccccc gui=bold
endif
:map F :foldclose <Enter>
"set statusline=%<%f%<%{FileTime()}%<%h%m%r%=%-20.(line=%03l,col=%02c%V,totlin=%L%)\%h%m%r%=%-30(,BfNm=%n%Y%)\%P\*%=%{CurTime()}
""set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P}}]
""set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P}}]
""set statusline=%F%m%r%h%w\ (%{&ff}){%Y}[%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
set statusline=%<%F%h%m%r%h%w%y\ %{&ff}\ %{strftime(\"%c\",getftime(expand(\"%:p\")))}%=\ lin:%l\,%L\ col:%c%V\ pos:%o\ ascii:%b\ %P
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
"colorscheme codeschool 
"colorscheme pychimp
colorscheme jellybeans

command! -bar -range=% Reverse <line1>,<line2>g/^/m<line1>-1|nohl
command Sudowrite w ! sudo tee % 
command Noindent setl noai nocin nosi inde=
command DeleteEmptyLines :g/^$/dx
vmap <C-v> c<ESC>"+p"

" spiiph's
" set statusline=
" set statusline+=%<\                       " cut at start
" set statusline+=%*[%n%H%M%R%W]%*\        " flags and buf no
" set statusline+=%-f\                    " path
" set statusline+=%=%*%y%*%*\              " file type
" set statusline+=%((%l,%c)%)\            " line and column
" set statusline+=%P                        " percentage of file
" 
"
"" jamessan's
""set statusline=   " clear the statusline for when vimrc is reloaded
""set statusline+=%-.n\                      " buffer number
"set statusline+=%f\                          " file name
"set statusline+=%h%m%r%w                     " flags
""set statusline+=[%{strlen(&ft)?&ft:'none'},  " filetype
""set statusline+=%{strlen(&fenc)?&fenc:&enc}, " encoding
""set statusline+=%{&fileformat}]              " file format
""set statusline+=%=                           " right align
""set statusline+=%{synIDattr(synID(line('.'),col('.'),),'name')}\  " highlight
""set statusline+=%b,x%-B\                   " current char
""set statusline+=%-.(%l,%c%V%)\ %<%P        " offset
"
"
"" tpope's
""set statusline+=[%n]\ %<%.f\ %h%w%m%r%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%y%=%-(\ %l,%c-%v\ %)%P
"
"
"" frogonwheels'
"set statusline=%f%w%m%h%*%r%*%{VarExists('b:devpath','<Rel>')}%*%{VarExists('b:relpath','<Dev>')}%{XLockStat()}%=%-(%l,%c%V%)%P
"
"
"" godlygeek's
"let &statusline='%<%f%{&mod?"[+]":""}%r%{&fenc !~ "^$\\|utf-" || &bomb ? "[".&fenc.(&bomb?"-bom":"")."]" : ""}%=%.(%l,%c%V %P%)'
"
"
"" Another way to write godlygeeks:
"set statusline=%<%f%m%r%{Fenc()}%=%.(%l,%c%V\ %P%)
"function! Fenc()
"    if &fenc !~ "^$\|utf-" || &bomb
"        return "[" . &fenc . (&bomb ? "-bom" : "" ) . "]"
"    else
"        return ""
"    endif
"endfunction
