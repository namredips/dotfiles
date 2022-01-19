
" ******  VIM PLUG ******
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'
" docs at: https://github.com/junegunn/vim-plug
"
" Initialize plugin system
call plug#begin()
Plug 'bling/vim-bufferline'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ivanov/vim-ipython'
Plug 'sheerun/vim-polyglot'
Plug 'tmhedberg/SimpylFold'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'jiangmiao/auto-pairs'
Plug 'flazz/vim-colorschemes'
Plug 'mrk21/yaml-vim'
Plug 'pedrohdz/vim-yaml-folds'
"Plug 'dart-lang/dart-vim-plugin'
Plug 'dense-analysis/ale'
"Plug 'natebosch/vim-lsc'
"Plug 'natebosch/vim-lsc-dart'

call plug#end()


" **** Global settings ****
let g:coc_global_extensions = [ 'coc-pyright', 'coc-flutter-tools' ]
set encoding=utf-8
set nocompatible
syntax enable
set nohlsearch
"filetype off
set tabstop=2
set shiftwidth=2
set expandtab
set splitright
set splitbelow
set noshowmode
highlight clear SignColumn
autocmd FileType python  setlocal cc=88



"
" *** COC general configurations ***
"
" *** coc floating window colors  ***
"
highlight CocFloating ctermbg=60 ctermfg=7
highlight Pmenu ctermbg=60 ctermfg=7

" *** coc diagnostics colors  ***
"

if has('nvim-0.4.3') || has('patch-8.2.0750')
	nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
endif


" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)

" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" *** end COC general

"
" vim-airline configurations
"
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" for tmuxline + vim-airline integration
let g:airline#extensions#tmuxline#enabled = 1

" for coc + vim-airline integration
let g:airline#extensions#coc#enabled = 1

" unicode symbols
"let g:airline_left_sep = '»'
let g:airline_left_sep = "\ue0b0"
"let g:airline_right_sep = '«'
"let g:airline_right_sep = '◀'
let g:airline_right_sep = "\ue0b2"
let g:airline_symbols.linenr = '␊'
"let g:airline_symbols.linenr = '␤'
"let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.branch = "\ue0a0"
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

set laststatus=2

" vim-airline configuration end


"
" ale
"
let g:airline#extensions#ale#enabled = 1
let g:ale_disable_lsp = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_list_window_size = 5
let g:ale_open_list = 1
let g:ale_fix_on_save = 1
let g:ale_lint_on_enter = 0
let g:ale_sign_error  = "\uF704\uF704"
let g:ale_sign_warning = "\uF071"
let g:ale_sign_style_error = 'CC'
let g:ale_sign_style_warning = '≈≈'
let b:ale_linters = {'python': ['flake8', 'bandit', 'pyright']}
let b:ale_fixers = {'python': ['isort', 'black', 'fixjson'], 'json': ['fixjson', 'prettier'] }


"highlight ALEError ctermfg=LightRed ctermbg=Red
highlight ALEErrorSign ctermfg=Red ctermbg=black
"highlight ALEStyleError ctermfg=LightBlue ctermbg=Blue
highlight ALEStyleErrorSign ctermfg=Blue ctermbg=Black
"highlight ALEWarning ctermbg=Yellow
highlight ALEWarningSign ctermfg=Yellow ctermbg=black
"highlight ALEStyleWarning ctermfg=Yellow ctermbg=black
"highlight ALEInfo ctermfg=LightBlue ctermbg=Blue
"highlight ALEInfoLine ctermfg=LightBlue ctermbg=Blue
"hi SpellBad ctermfg=Blue cterm=underline
hi Search ctermbg=None ctermfg=green
augroup CloseLoclistWindowGroup
  autocmd!
  autocmd QuitPre * if empty(&buftype) | lclose | endif
augroup END

" *** coc-git ***
"
" Clear background from git symbols
highlight clear DiffAdd
highlight clear DiffChange
highlight clear DiffDelete
highlight DiffDelete ctermfg=blue
highlight DiffAdd ctermfg=green
highlight DiffChange ctermfg=yellow

" SimplyFold
let g:SimpylFold_docstring_preview=1

" *** LANGUAGES ***
"
"python
"
autocmd Filetype python setl et ts=4 sw=4 number

"
"Dart/Flutter
"
"let g:lsc_auto_map = v:true
let g:dart_style_guide = 2
let g:dart_format_on_save = 1

"yaml
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab indentkeys-=0#

" *** END LANGUAGES

augroup JumpCursorOnEdit
     au!
      autocmd BufReadPost *
       \ if expand("<afile>:p:h") !=? $TEMP |
       \ if line("'\"") > 1 && line("'\"") <= line("$") |
       \ let JumpCursorOnEdit_foo = line("'\"") |
       \ let b:doopenfold = 1 |
       \ if (foldlevel(JumpCursorOnEdit_foo) > foldlevel(JumpCursorOnEdit_foo - 1)) |
       \ let JumpCursorOnEdit_foo = JumpCursorOnEdit_foo - 1 |
       \ let b:doopenfold = 2 |
       \ endif |
       \ exe JumpCursorOnEdit_foo |
       \ endif |
       \ endif
       " Need to postpone using "zv" until after reading the modelines.
         autocmd BufWinEnter *
       \ if exists("b:doopenfold") |
       \ exe "normal zv" |
       \ if(b:doopenfold > 1) |
       \ exe "+".1 |
       \ endif |
       \ unlet b:doopenfold |
       \ endif
augroup END

