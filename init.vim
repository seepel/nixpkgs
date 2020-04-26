colorscheme github
set tabstop=2
set nocompatible
syntax on
filetype plugin indent on
set autoindent
set cursorline
set encoding=utf-8
set expandtab
set lazyredraw
set noerrorbells
set vb t_vb=
set nowrap
set nu
set splitright
set smartcase
set smartindent
set shiftwidth=2
set wildmode=list:longest

" page down/up for mac stnh 
:map <space> <c-f>
:map <backspace> <c-b>
noremap gb :NERDTreeFind<CR>

" use tab to trigger completion
inoremap <silent><expr> <TAB>                                                                           
       \ pumvisible() ? "\<C-n>" :                                                                       
       \ <SID>check_back_space() ? "\<TAB>" :                                                            
       \ coc#refresh()                                                                                   
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"   

" Fix autofix problem of current line
" vim can't map <D-.> :(
nnoremap <Leader>f :CocFix<CR>
nnoremap <Leader>t :call CocAction('doHover')<CR>

" open current file's changes in a new tab.  holy balls this is useful
command! Changes tabedit % | Gdiff
command! Todos tabnew | call GrepFor("TODO:")<CR>

" debounced version of 'fugitive#head()' -- updates the powerline branch when you
" switch branches on the console.  airline generally just updates once... which is silly.
fu! GetCurrentBranch()
  let l:curtime = strftime('%s')

  if !exists('g:__git_refresh_branch_at') || g:__git_refresh_branch_at < l:curtime
    let g:__git_refresh_branch_at = l:curtime + 3   " update only every N seconds
    let g:__git_current_branch = fugitive#head()
  endif

  return g:__git_current_branch
endfu

" airline
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts=1
let g:airline_powerline_fonts = 1
let g:airline_section_b = ' %{GetCurrentBranch()}'   " make sure the branch gets updated every few seconds
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '±'
let g:gitgutter_sign_removed = '−'
let g:gitgutter_sign_modified_removed = '≈'

let g:airline_theme = 'papercolor'

" enable indent guides
let g:indent_guides_enable_on_vim_startup = 1

" vim-prettier -> post npm install four lines at bottom file to run prettier setup
" Need coc -> coc-install
" uninstall gitgutter to see lint errors
" lop -> location open -> coc fixers
" restart tsserver -> CocRestart
" \f autofix \t show type

