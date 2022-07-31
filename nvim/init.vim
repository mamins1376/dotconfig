let not_android = 'android' !=? trim(system('uname -o'))

" environment
"let g:python_host_prog = '/sbin/python2'
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

" indent-guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

" python-mode
let g:pymode_lint = 0
let g:pymode_rope = 0

" coc
let g:coc_global_extensions = [
      \'coc-tsserver',
      \'coc-rust-analyzer',
      \'coc-json',
      \'coc-vimtex',
      \'coc-pyright',
      \'coc-css',
      \'coc-html',
      \]

" session
let g:session_directory = '~/.local/share/nvim/session/'
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

" netrw
let g:netrw_list_hide='\(^\|\s\s\)\zs\.\S\+'

" vim-vue
let g:vue_disable_pre_processors = 1

" vimtex
let g:vimtex_view_method = 'zathura'

" XML-Folding
let g:xml_syntax_folding = 1

" termdebug
if not_android
  packadd termdebug
  let g:termdebugger = "arm-none-eabi-gdb"
  let g:termdebug_popup = 0
  let g:termdebug_wide = 163
  tnoremap <Esc> <C-\><C-n>
  nnoremap <silent> <leader>b :Break<CR>
  nnoremap <silent> <leader>bc :Clear<CR>
  nnoremap <silent> <leader>c :Continue<CR>
endif

" plugins
call plug#begin('~/.local/share/nvim/plugged')

Plug 'ryanoasis/vim-devicons'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'itchyny/lightline.vim'
Plug 'srcery-colors/srcery-vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'moll/vim-bbye'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'tpope/vim-abolish'

Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'

Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-fugitive'

Plug 'raimondi/delimitmate'

"Plug 'mattn/emmet-vim'

Plug 'cespare/vim-toml'

Plug 'kevinoid/vim-jsonc'

Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'ollykel/v-vim'

Plug 'ledger/vim-ledger'

if not_android
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'majutsushi/tagbar'

  Plug 'vim-syntastic/syntastic'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'sakhnik/nvim-gdb', { 'do': './install.sh' }
  "Plug 'neomake/neomake'

  " Plug 'racer-rust/vim-racer'
  Plug 'rust-lang/rust.vim'
  Plug 'rhysd/vim-llvm'
  Plug 'jamespeapen/swayconfig.vim'

  "Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
  Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins', 'for': ['python', 'vim-plug'] }

  " Plug 'ap/vim-css-color' " Slows down X(HT)ML editing AF
  Plug 'hail2u/vim-css3-syntax'
  Plug 'cakebaker/scss-syntax.vim'
  Plug 'digitaltoad/vim-pug'
  Plug 'posva/vim-vue'
  Plug '1995parham/vim-spice'
  Plug 'dcharbon/vim-flatbuffers'

  Plug 'jvirtanen/vim-octave'

  Plug 'lervag/vimtex'

  Plug 'dart-lang/dart-vim-plugin'

  Plug 'gisraptor/vim-lilypond-integrator'
  " Plug 'kassio/neoterm'
  " Plug 'vim-scripts/XML-Folding'
endif

call plug#end()

colorscheme srcery
set mouse=a
set background=dark
set termguicolors
set splitright
highlight Normal ctermbg=None guibg=None
highlight NonText ctermbg=None guibg=None

if not_android
  set termbidi
endif

set exrc
set number
set noshowmode showtabline=2
set foldmethod=syntax
set nowrap

set noet ts=4 sts=4 sw=4
au FileType tex,vue,html,xml,dart,typescript,typescriptreact set et ts=2 sts=2 sw=2

au FileType netrw setl bufhidden=delete

" CoC
if not_android
  execute 'source '.expand('<sfile>:p:h').'/coc.vim'
endif

" gdb
if not_android
  nmap <leader>dg :GdbStart\ gdb\ -q\ a.out
endif

" workspace
"nmap <leader>ss :SaveSession<CR>
"nmap <leader>s!s :SaveSession!<CR>
"nmap <leader>so :OpenSession<CR>
"nmap <leader>s!o :OpenSession!<CR>
"nmap <leader>sS :DeleteSession<CR>
"nmap <leader>s!S :DeleteSession!<CR>
"nmap <leader>sr :RestartVim<CR>

" fix the conflict between coc and vimtex for K
if not_android
  nnoremap <silent> K :call <sid>show_documentation()<cr>
  function! s:show_documentation()
    if index(['vim', 'help'], &filetype) >= 0
      execute 'help ' . expand('<cword>')
    elseif &filetype ==# 'tex'
      VimtexDocPackage
    else
      call CocAction('doHover')
    endif
  endfunction
endif

" sudo-write
cnoremap w!! execute 'silent! write !pkexec tee % >/dev/null' <bar> edit!
