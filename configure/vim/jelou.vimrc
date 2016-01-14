set nocompatible

"if has("win32") || has("win16")
"  let osys="windows"
"else
let osys=system('uname -s')
"endif

"set term=xterm-color
set noswapfile
set history=1000
set autoindent
set smartindent
set nu
set number
set tabstop=8
set shiftwidth=4
set noexpandtab
set showmatch
set guioptions-=T
set guioptions-=r

set vb t_vb=
set ruler
set incsearch
set hlsearch

if (osys =~ "Linux")
let Tlist_Ctags_Cmd = '/usr/bin/ctags'
endif


set softtabstop=4
filetype on
filetype plugin on
syntax on
au FileType c,cpp set cindent
au FileType c,cpp set tabstop=4
au FileType tmc set tabstop=4
au FileType c,cpp,tmc set shiftwidth=4 | set expandtab

set tags=./tags,../tags,../../tags,../../../tags,../../../../tags
let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Enable_Fold_Column = 0


if filereadable("cscope.out")
  cs add cscope.out
elseif filereadable("../cscope.out")
  cs add ../cscope.out ..
elseif filereadable("../../cscope.out")
  cs add ../../cscope.out ../..
elseif filereadable("../../../cscope.out")
  cs add ../../../cscope.out ../../..
elseif filereadable("../../../../cscope.out")
  cs add ../../../../cscope.out ../../../..
elseif $CSCOPE_DB != ""
  cs add $CSCOPE_DB
endif


nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>
map Y "+y

let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

nnoremap <silent> <F12> :A<CR>
nnoremap <silent> <F4> :Grep<CR>

if has("gui_running")
  if (osys =~ "SunOS")
    set guifont=-adobe-courier-medium-r-normal--14-140-75-75-m-90-iso8859-1
    set lines=50
    set columns=90
  else
    set lines=45
    set columns=90
  endif
"  let psc_style='cool'
  let Tlist_Auto_Open=0
  colorscheme koehler
  set background=dark
else
  set background=dark
  let psc_style='cool'
endif

hi Over80 guifg=fg guibg=Blue
au BufNewFile,BufRead *.* match Over80 '\%>80v.*'
