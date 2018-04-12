"========================================================
" INSTALL PLUGINS
"========================================================
filetype off
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'flazz/vim-colorschemes'

Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'ctrlpvim/ctrlp.vim'

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'mbbill/undotree'

Plug 'terryma/vim-multiple-cursors'
Plug 'easymotion/vim-easymotion'
Plug 'matze/vim-move'

Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'Yggdroot/indentLine'

Plug 'janko-m/vim-test'

Plug 'ntpeters/vim-better-whitespace'
Plug 'junegunn/vim-easy-align'

Plug 'mxw/vim-jsx'
Plug 'alvan/vim-closetag'

Plug 'shime/vim-livedown'
Plug 'kylef/apiblueprint.vim'
Plug 'ryanoasis/vim-devicons'

Plug 'pangloss/vim-javascript'
Plug 'maksimr/vim-jsbeautify'

" python
Plug 'zchee/deoplete-jedi'
Plug 'google/yapf'
Plug 'cburroughs/pep8.py'

Plug 'neomake/neomake'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
"Plug 'junegunn/fzf.vim'
Plug '~/.fzf'

if has('nvim')
  function! DoRemote(arg)
    UpdateRemotePlugins
  endfunction
  Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
endif
call plug#end()

language en_US

"========================================================
" THEMES AND INTERFACE
"========================================================
let g:airline#extensions#tabline#enabled = 1
let g:Powerline_symbols = 'fancy'
let g:airline_powerline_fonts = 1
let g:airline_symbols = {}
let g:airline_symbols.space = "\ua0"
let s:spc = g:airline_symbols.space
function! AirlineInit()
	let g:airline_section_a = airline#section#create(['%{toupper(mode())}'])
	let g:airline_section_b = airline#section#create([''])
	let g:airline_section_z = airline#section#create(['%p%%'])
endfunction

"========================================================
" BASIC CONFIG
"========================================================
syntax on
filetype on
filetype indent on
filetype plugin on
set cursorline
set hlsearch
set bs=2
set ai
set ruler
set linespace=1
"set gfn=DejaVu\ Sans\ Mono\ for\ Powerline:h13
let g:auto_ctags = 1
"set wrap linebreak nolist
set breakindent
set nofoldenable
set foldmethod=indent
set tags=./tags;,tags;
set number
set wrap linebreak nolist
set expandtab
set tabstop=2 shiftwidth=2 softtabstop=2
set autoindent
set clipboard=unnamed
set splitright
set splitbelow
set ttyfast
set lazyredraw
set laststatus=2
set encoding=utf8
"set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types:h11
"set background=dark
"set textwidth=90
set rtp+=/usr/local/opt/fzf
set mouse=a
set noswapfile
set showmatch
set relativenumber
colorscheme monokai

" Fix iterm display
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

"========================================================
" NERDTREE
"========================================================
map <silent> <leader>ls <ESC>:NERDTreeToggle<CR>
map <silent> <leader>lf <ESC>:NERDTreeFind<CR>
map <silent> <leader>rev :NERDTreeFind<CR>
let NERDTreeMapOpenSplit = 'x'
let NERDTreeMapOpenVSplit = 'v'
let NERDTreeIgnore = ['\.pyc$', '^__pycache__$', '.DS_Store']
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

"========================================================
" NERDCOMMENTER
"========================================================
let g:NERDSpaceDelims = 1
let g:NERDTrimTrailingWhitespace = 1

"========================================================
" CONFIG GITGUTTER
"========================================================
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_removed = 'x'
let g:gitgutter_sign_removed_first_line = 'x'
let g:gitgutter_sign_modified_removed = 'x'

"========================================================
" CONFIG NEOMAKE
"========================================================
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_javascript_eslint_exe = system('PATH=$(npm bin):$PATH && which eslint | tr -d "\n"')
let g:neomake_error_sign = {'text': '!!', 'texthl': 'NeomakeWarningMsg'}
let g:neomake_warning_sign = {'text': '!', 'texthl': 'NeomakeErrorMsg'}

"========================================================
" CONFIG DEOPLETE
"========================================================
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources = {}

"========================================================
" KEY BINDING
"========================================================
" ### Disable arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" ### Git fugitive
map <silent> gs :Gstatus<CR>
map <silent> gd :Gdiff<CR>
map <silent> gb :Gblame<CR>
map <silent> ghub :Gbrowse<CR>
map <silent> gc! :Gread<CR>
map <silent> gt :call TimeLapse() <cr>

" ### Markdown
nmap <leader>md :LivedownPreview<CR>
let g:markdown_enable_spell_checking = 0

" ### Easy Align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" ### Quick replace
map <silent> <leader>' cs'"
map <silent> <leader>" cs"'

" ### Quick change window focus
map <silent> <space>h <C-W><C-H>
map <silent> <space>j <C-W><C-J>
map <silent> <space>k <C-W><C-K>
map <silent> <space>l <C-W><C-L>

" ### Quick action
map <space><space> <ESC>:w<CR>
map <silent> <leader>q <ESC>:q<CR>
nnoremap <silent> <CR> <ESC>:noh<CR>
" Buffer
nmap <silent> <A-h> :bn <CR>
nmap <silent> <A-l> :bp <CR>

" ### Easy Motion
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
map / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
nmap <silent> <tab> <Plug>(easymotion-w)

" ### FZF
map <c-p> <ESC>:Files<CR>
map <c-o> <ESC>:Tags<CR>
map <c-h> <ESC>:History<CR>
map <silent> <leader>/ <ESC>:BLines<CR>
map <leader>ag <ESC>:Ag<space>
map <leader>as <ESC>:call AgInFolder()<CR>
map <silent> <leader>aa <ESC>:call fzf#vim#ag(expand("<cword>"), fzf#vim#layout(expand("<bang>0")))<cr>
map <c-]> <ESC>:call fzf#vim#tags(expand("<cword>"), fzf#vim#layout(expand("<bang>0")))<cr>
map <silent> <leader>mm <ESC>:Commands<CR>

"========================================================
" DONT KNOW WHY IT'S HERE
"========================================================
let g:indentLine_enabled = 0
" Tmux navigation
let g:tmux_navigator_no_mappings = 1
" Rpsec config
let test#strategy = "neovim"
" Solve vim ESC delay
set timeoutlen=1000 ttimeoutlen=0
if has("autocmd")
  autocmd VimEnter * call AirlineInit()
  autocmd VimEnter * call IndentGuideToggle()
  autocmd BufWritePre * StripWhitespace
  autocmd BufWritePost * Neomake
  autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
  autocmd FileType markdown set textwidth=80
  autocmd FileType markdown set formatoptions-=t
endif
let g:webdevicons_enable_ctrlp = 1
let g:move_key_modifier = 'C'
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.html.eex,*.html.erb,*.jsx,*.js"
let g:jsx_ext_required = 0
let g:fzf_tags_command = 'ctags -R --exclude=.git --exclude=node_modules'

" FZF settings
set rtp+=/usr/local/opt/fzf

"========================================================
" FUNCTIONS
"========================================================
function! URT()
  return system('ctags -R --languages=python --exclude=.git --exclude=log . $(bundle list --paths)')
endfunction

" Toogle indents
function! IndentGuideToggle()
  let g:indent_guide_displayed = get(g:, 'indent_guide_displayed', '0')
  if g:indent_guide_displayed=='0'
    let g:indent_guide_displayed = '1'
    execute 'IndentLinesEnable'
    set colorcolumn=+1
  else
    let g:indent_guide_displayed = '0'
    execute 'IndentLinesDisable'
    set colorcolumn=0
  endif
endfunction

function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

function! AgInFolder()
  call inputsave()
  let dir = input('Enter folder to search in: ')
  call inputrestore()
  call fzf#vim#ag(dir, "", fzf#vim#layout(expand("<bang>0")))
endfunction

"========================================================
" MAPPING MISC
"========================================================
map <silent> <leader>urt <ESC>:call URT()<CR>
map <silent> <leader>i <ESC>:call IndentGuideToggle()<CR>
map <silent> <leader>hi :History<CR>
map <silent> <leader><leader> <C-^><CR>
map <silent> <leader>u :UndotreeToggle<CR>
map <silent> <leader>path :let @+=@%<CR>
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
noremap <silent> <expr> ^ (v:count == 0 ? 'g^' : '^')
noremap <silent> <expr> $ (v:count == 0 ? 'g$' : '^')
noremap <silent> <leader>n :call NumberToggle()<cr>
if has("nvim")
  tnoremap <c-e> <C-\><C-n>
end
