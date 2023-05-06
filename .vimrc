filetype plugin on
filetype plugin indent on

set nocompatible

" vim:fdm=marker:fdl=0:

" Plug-ins {{{1
call plug#begin()

Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/seoul256.vim'
Plug 'lervag/vimtex'
Plug 'sirver/ultisnips'
Plug 'arcticicestudio/nord-vim'
Plug 'preservim/nerdtree'
Plug 'liuchengxu/vista.vim'
Plug 'b4skyx/serenade'
Plug 'sheerun/vim-polyglot'
Plug 'morhetz/gruvbox'
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'


call plug#end()

" My own 'SETs' {{{1
filetype indent off
set hidden
set shiftwidth=4
set tabstop=4
set textwidth=75
set smarttab
set smartindent
set expandtab
set showmatch
set number
set numberwidth=1
set relativenumber
set mouse=a

set runtimepath+=~/.vim/UltiSnips

colorscheme serenade

" My map's {{{1

" Move line down
nnoremap - ddp

" Move line up
nnoremap _ kddpk

" Uppercase the word
inoremap <c-u> <esc>vbUwa
nnoremap <c-u> vbUw

" Limelight {{{1
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

" Default: 0.5
let g:limelight_default_coefficient = 0.7

" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 1

" Beginning/end of paragraph
"   When there's no empty line between the paragraphs
"   and each paragraph starts with indentation
let g:limelight_bop = '^\s'
let g:limelight_eop = '\ze\n^\s'

" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1

" autocmd! User GoyoEnter Limelight
" autocmd! User GoyoLeave Limelight!

" I don't know for what {{{1
set t_Co=256
set background=dark
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE

" Folders {{{1
augroup remember_folds
  autocmd!
  autocmd BufWinLeave * mkview
  autocmd BufWinEnter * silent! loadview
augroup END

" VIM-tex {{{1
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

" UltiSnips {{{1
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'



" Vim-markdown
" let g:vim_markdown_math = 1

augroup filetypedetect_markdown
   au!
   au BufRead,BufNewFile *.txt set ft=markdown
augroup END


" Vim NERDTree
let g:NERDTreeNodeDelimiter = "\u00a0"

" Quitting whether Goyo is active or not
ca wq :w<cr>:call Quit()<cr>
ca q :call Quit()<cr>
function! Quit()
    if exists('#goyo')
        Goyo
    endif
    quit
endfunction

au BufReadPost,BufNewFile *.md,*.txt,*.tex set background=light | colorscheme gruvbox | Goyo
