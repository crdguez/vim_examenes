"set hidden
set number
set path+=$PWD/**,$HOME/**
"set nocp
"filetype plugin on

"
" Habilitar el modo de sintaxis LaTeX

set spelllang=es
syntax enable
filetype plugin indent on

" Usar auto-indentación adecuada para LaTeX
set smartindent
set autoindent
set tabstop=2
set shiftwidth=2
set expandtab

" Definir comandos de compilación para LaTeX
autocmd FileType tex nnoremap <buffer> <F5> :w<CR>:!pdflatex %<CR>

" Comandos para ver el PDF generado
nnoremap <F9> :!xdg-open %:r.pdf<CR>  " Abre el PDF (en Linux)
" nnoremap <F9> :!open %.pdf<CR>   " En macOS
" nnoremap <F9> :!start %.pdf<CR>  " En Windows

call plug#begin()

" Plugins para autoescritura
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'vim-pandoc/vim-pandoc'
Plug 'crdguez/vim_examenes' 
Plug 'crdguez/vim_md_a_pdf' 
"Plug 'vim-pandoc/vim-pandoc-syntax'
"Plug 'conornewton/vim-pandoc-markdown-preview'
"Plug 'lingnand/pandoc-preview.vim'
Plug 'vim-airline/vim-airline'
"Plug '~/.vim/plugged/pandoc-preview.vim'
"Plug '~/.vim/plugged/vim-paste-text'
"Plug '~/.vim/plugged/examenes'

"Plug 'dracula/dracula-themer'

" Instalar vimtex
Plug 'lervag/vimtex'

Plug '~/.vim/plugged/vim-test-snippets'


call plug#end()

let g:md_pdf_viewer="zathura"
let g:pandoc_preview_pdf_cmd = "zathura"
let g:pandoc_generate_pdf_dir = "/tmp"

"autocmd BufWritePost *.md make

" Usar pdflatex como compilador
"let g:vimtex_compiler_method = 'latexmk'
"let g:vimtex_compiler_latexmk = 0
"let g:vimtex_compiler_method = 'pdflatex'

" Habilitar la vista previa del PDF (requerido tener un visor de PDF configurado)
let g:vimtex_view_method = 'zathura'  " Para Linux, usa otro visor en caso necesario
"let g:vimtex_view_method = 'Skim'  " Para macOS
"let g:vimtex_view_method = 'SumatraPDF'  " Para Windows
" Compilar automáticamente
" let g:vimtex_compiler_continuous = 1

" No abrir la lista de errores sola
let g:vimtex_quickfix_mode = 0

" Para que la compilaciónde latex la haga en /tmp
let g:vimtex_compiler_latexmk = {
      \ 'out_dir' : '/tmp/vimtex',
      \}
"      \ 'options' : ['-pdf', '-synctex=1', '-interaction=nonstopmode'],
      \ }

let g:vimtex_view_general_options =
      \ '--synctex-forward @line:@col:@tex @pdf'

"Para activar la autoescritura con <tab>

let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

" Para autocompletado con vimtex
"
" VimTeX omnifunc
autocmd FileType tex setlocal omnifunc=vimtex#complete#omnifunc

" Completado con Ctrl-l
"
inoremap <C-l> <C-x><C-o>

" -------------------------------
" Atajos para comentar/descomentar en LaTeX (VimTeX)
" -------------------------------

" Comentar líneas en Visual Mode
vmap <leader>c :s/^/% /<CR>

" Descomentar líneas en Visual Mode
vmap <leader>u :s/^% //<CR>

" Saltar entre preguntas
nnoremap ]q /\v\\question<CR>
nnoremap [q ?\v\\question<CR>

" Saltar entre partes
nnoremap ]p /\v\\part<CR>
nnoremap [p ?\v\\part<CR>

