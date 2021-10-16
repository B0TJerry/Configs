" Plugins will be downloaded under the specified directory.
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Declare the list of plugins.
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'scrooloose/syntastic'
Plug 'vim-jp/vim-cpp'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'georgewitteman/vim-fish'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'w0rp/ale'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'PhilRunninger/nerdtree-buffer-ops'
Plug 'PhilRunninger/nerdtree-visual-selection'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-surround'
Plug 'mhinz/vim-startify'
Plug 'rust-lang/rust.vim'
" List ends here. Plugins become visible to Vim after this call.
call plug#end()

"Auto Command
autocmd vimenter * ++nested colorscheme gruvbox

 " Start NERDTree and put the cursor back in the other window.
 autocmd VimEnter * NERDTree | wincmd p

 " Exit Vim if NERDTree is the only window left.
 autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
 " Enable mouse support
 autocmd VimEnter * set mouse=a
 " Enable line numbers
 autocmd VimEnter * set number
"use the powerline fonsts for airline
let g:airline_powerline_fonts = 1

"change mappings
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" uses a more POSIX compliant shell to cope with FISH's lack of POSIX
" compilance
if &shell =~# 'fish$'
    set shell=sh
endif

let NERDTreeShowHidden = 1
"Startify Settings
	"Sets order and name of the items on the start page
let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   Most Recently Used']            },
          \ { 'type': 'sessions',  'header': ['   Sessions']                      },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']                     },
          \ { 'type': 'commands',  'header': ['   Commands']                      },
          \ ]
	"changes the ammount of files allowed to be listed by the files header
let g:startify_files_number = 5 
 	"changes the default session directory
let g:startify_session_dir = '~/.config/nvim/session'
	"sets bookmarks
let g:startify_bookmarks = [ '~/.config', '~/.config/suckless/dwm', '~/.config/suckless/dmenu', '~/.config/fish', '~/.config/nvim/init.vim']
	"sets commands
let g:startify_commands = [
	\ ':help reference',
        \ ':h startify',
        \ ':Tutor'
        \ ]

	"Changes the start menu to automatically use utf8 encoding
let g:startify_fortune_use_unicode = 1
	"Changes the Header to something actually visually pleasing
let g:startify_custom_header = [
	    \ '                                            ▄▄                  ',  
	    \ '▀███▄   ▀███▀                ▀████▀   ▀███▀ ██                  ', 
	    \ '  ███▄    █                    ▀██     ▄█                       ', 
	    \ '  █ ███   █   ▄▄█▀██  ▄██▀██▄   ██▄   ▄█  ▀███ ▀████████▄█████▄ ', 
	    \ '  █  ▀██▄ █  ▄█▀   ████▀   ▀██   ██▄  █▀    ██   ██    ██    ██ ',  
	    \ '  █   ▀██▄▓  ▓█▀▀▀▀▀▀██     ██   ▀▓█ ▓▀     ▓█   ▓█    ██    ██ ',  
	    \ '  ▓     ▓█▓  ▓█▄    ▄██     ▓█    ▓██▄      ▓█   ▓█    ▓█    ██ ',  
	    \ '  ▓   ▀▓▓▓▓  ▓▓▀▀▀▀▀▀▓█     ▓▓    ▓▓ ▓▀     ▓▓   ▓▓    ▓▓    ▓▓ ',  
	    \ '  ▓     ▓▓▓  ▒▓▓     ▓▓▓   ▓▓▓    ▓▓▒▒      ▓▓   ▒▓    ▒▓    ▓▓ ',  
	    \ '▒ ▒ ▒    ▒▓▓  ▒ ▒ ▒▒  ▒ ▒ ▒ ▒      ▒      ▒ ▒ ▒▒ ▒▓▒  ▒▒▒   ▒▒▓▒', 
	    \]
                                                                 
                                                                 

