" environment
let g:python_host_prog = '/sbin/python2'
let g:python3_host_prog = '/sbin/python3'

" nerdtree
let NERDTreeAutoDeleteBuffer=1
map <leader>no :NERDTree<CR>
map <leader>nO :NERDTreeClose<CR>
map <leader>nn :NERDTreeFocus<CR>
map <leader>nf :NERDTreeFind<CR>
map <leader>ng :NERDTreeVCS<CR>
map <leader>nr :NERDTreeRefreshRoot<CR>

" disable globally installed powerline
let g:powerline_loaded = 1

" srcery
let g:srcery_italic = 1

" lightline
execute 'source '.expand('<sfile>:p:h').'/lightline.vim'

" python-mode
let g:pymode_lint = 0
let g:pymode_rope = 0

" session
let g:session_directory = $XDG_DATA_HOME.'/nvim/session/'
let g:session_autosave = 'no'
let g:session_autoload = 'no'

" racer
let g:racer_experimental_completer = 1
map <leader>rr :RustRun<CR>
map <leader>rp :RustExpand<CR>
map <leader>ri :RustEmitIr<CR>
map <leader>ra :RustEmitAsm<CR>
nmap <leader>rl :RustFmt<CR>
vmap <leader>rl :RustFmtRange<CR>

" ledger
let g:ledger_date_format = '%y/%m/%d,%H:%M'
let g:ledger_bin = '/sbin/hledger'
let g:ledger_extra_options = ''

" delimitmate
let delimitMate_expand_space = 1
let delimitMate_expand_cr = 1
let delimitMate_balance_matchpairs = 1
au FileType rust,html,xml let delimitMate_matchpairs = '(:),[:],{:},<:>'

" tagbar
map <leader>tt :TagbarToggle<CR>
map <leader>to :TagbarOpen<CR>
map <leader>tT :TagbarClose<CR>

" syntastic
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = []
let g:syntastic_asm_compiler = "arm-none-eabi-gcc"
let g:syntastic_rust_checkers = []

" indentguides
let g:indentguides_ignorelist = ['text']
let g:indentguides_tabchar = '╎'
hi Whitespace ctermfg=240 guifg=#585858

" vim-vue
let g:vue_disable_pre_processors = 1

" XML-Folding
let g:xml_syntax_folding = 1

" termdebug
packadd termdebug
let g:termdebugger = "arm-none-eabi-gdb"
let g:termdebug_popup = 0
let g:termdebug_wide = 163
tnoremap <Esc> <C-\><C-n>
nnoremap <silent> <leader>b :Break<CR>
nnoremap <silent> <leader>bc :Clear<CR>
nnoremap <silent> <leader>c :Continue<CR>

" plugins
call plug#begin('~/.local/share/nvim/plugged')

Plug 'ryanoasis/vim-devicons'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'itchyny/lightline.vim'
Plug 'srcery-colors/srcery-vim'
Plug 'thaerkh/vim-indentguides'
Plug 'moll/vim-bbye'
Plug 'MaxMEllon/vim-jsx-pretty'

Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-vinegar'
Plug 'mattn/emmet-vim'

Plug 'raimondi/delimitmate'
Plug 'vim-syntastic/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'editorconfig/editorconfig-vim'
Plug 'sakhnik/nvim-gdb', { 'do': './install.sh' }
Plug 'neomake/neomake'

" Plug 'racer-rust/vim-racer'
Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'
Plug 'kevinoid/vim-jsonc'

"Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins', 'for': ['python', 'vim-plug'] }

" Plug 'ap/vim-css-color' " Slows down X(HT)ML editing AF
Plug 'pangloss/vim-javascript'
Plug 'hail2u/vim-css3-syntax'
Plug 'cakebaker/scss-syntax.vim'
Plug 'digitaltoad/vim-pug'
Plug 'leafgarland/typescript-vim'
"Plug 'posva/vim-vue'
Plug '1995parham/vim-spice'

Plug 'dart-lang/dart-vim-plugin'

Plug 'ledger/vim-ledger'
Plug 'gisraptor/vim-lilypond-integrator'
" Plug 'kassio/neoterm'
" Plug 'vim-scripts/XML-Folding'

call plug#end()

colorscheme srcery
set background=dark
set termguicolors
set termbidi
set splitright
highlight Normal ctermbg=None guibg=None
highlight NonText ctermbg=None guibg=None

set exrc
set number
set noshowmode showtabline=2
set foldmethod=syntax
set nowrap

set noet ts=4 sts=4 sw=4
au FileType vue,html,xml,dart,typescript,typescriptreact set et ts=2 sts=2 sw=2

au FileType netrw setl bufhidden=delete

" CoC
execute 'source '.expand('<sfile>:p:h').'/coc.vim'

" gdb
nmap <leader>dg :GdbStart\ gdb\ -q\ a.out

" workspace
"nmap <leader>ss :SaveSession<CR>
"nmap <leader>s!s :SaveSession!<CR>
"nmap <leader>so :OpenSession<CR>
"nmap <leader>s!o :OpenSession!<CR>
"nmap <leader>sS :DeleteSession<CR>
"nmap <leader>s!S :DeleteSession!<CR>
"nmap <leader>sr :RestartVim<CR>

" sudo-write
cnoremap w!! execute 'silent! write !pkexec tee % >/dev/null' <bar> edit!