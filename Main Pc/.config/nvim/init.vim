" Plugins will be downloaded under the specified directory.
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Declare the list of plugins.
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-syntastic/syntastic'
Plug 'vim-jp/vim-cpp'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'igormorgado/vim-hints'
Plug 'YankRing.vim'
" List ends here. Plugins become visible to Vim after this call.
call plug#end()

"Auto Command
autocmd vimenter * ++nested colorscheme gruvbox

 " Start NERDTree and put the cursor back in the other window.
 autocmd VimEnter * NERDTree | wincmd p
 " Enable mouse support
 autocmd VimEnter * set mouse=a
 " Enable line numbers
 autocmd VimEnter * set number

 " Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

"use the powerline fonsts for airline
let g:airline_powerline_fonts = 1

"change mappings
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>


