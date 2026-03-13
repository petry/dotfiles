" ─── GERAL ───────────────────────────────────────────────────────────
set number              " número de linhas
set relativenumber      " número relativo (ótimo pra navegar)
set cursorline          " destaca linha atual
set scrolloff=8         " mantém 8 linhas de contexto ao rolar
set clipboard=unnamed   " copia direto pro clipboard do macOS

" ─── INDENTAÇÃO ──────────────────────────────────────────────────────
set tabstop=2
set shiftwidth=2
set expandtab           " espaços ao invés de tab
set smartindent

" ─── BUSCA ───────────────────────────────────────────────────────────
set ignorecase          " busca case-insensitive
set smartcase           " mas respeita maiúscula se você digitar
set hlsearch            " destaca resultados
set incsearch           " busca enquanto digita

" ─── VISUAL ──────────────────────────────────────────────────────────
set termguicolors
set signcolumn=yes      " coluna de status (evita o layout pular)
syntax on

" ─── ATALHOS ÚTEIS ───────────────────────────────────────────────────
let mapleader = " "

nnoremap <leader>w :w<CR>       " Space+w salva
nnoremap <leader>q :q<CR>       " Space+q fecha
nnoremap <Esc> :noh<CR>         " Esc limpa highlight da busca
