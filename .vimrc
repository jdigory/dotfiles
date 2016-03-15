set expandtab tabstop=4 shiftwidth=4
set ai ignorecase smartcase hlsearch incsearch copyindent

syntax on

let $BASH_ENV = '~/.bash_aliases_for_vim'

set matchpairs+=<:>
map  !G perl -MText::Autoformat -X -e 'autoformat { tabspace => 4 }'
vmap    _L      "zxi[L][/L]F["zP
vmap          !perl -MText::Autoformat -X -0777 -e 'autoformat {all=>1}'
map		<F12>	:if exists("syntax_on") <Bar> syntax off <Bar> else <Bar> syntax enable <Bar> endif<CR>

"set formatoptions=tcqn1r
"set flp+=\\\|^\\*\\s*

nmap <leader>h :nohlsearch<CR>
nmap <leader>t :set expandtab<CR>
nmap <leader>T :set noexpandtab<CR>

" fix syntax redraw problems:
autocmd BufEnter * :syntax sync fromstart
"noremap <S-F12> <Esc>:syntax sync fromstart<CR>
"inoremap <S-F12> <C-o>:syntax sync fromstart<CR>

filetype plugin on 
" http://vim.wikia.com/wiki/Disable_automatic_comment_insertion
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

autocmd FileType perl setlocal keywordprg=sh\ -c\ 'perldoc\ -f\ \$1\ \|\|\ perldoc\ \$1'\ --
autocmd FileType css setlocal tabstop=2 shiftwidth=2

command -range=% -nargs=* Tidy <line1>,<line2>!perltidy -q -l=150
noremap <F4> :Tidy<CR>

command -range=% -nargs=* HTMLTidy <line1>,<line2>!tidy -q -wrap 150
noremap <F5> :HTMLTidy<CR>

augroup mkd
  autocmd BufRead *.md  set ai formatoptions=tcroqn2 comments=n:>
augroup END

au BufNewFile,BufRead *.hbs set filetype=html
au BufNewFile,BufRead *.t set filetype=perl
au BufNewFile,BufRead *.pl6 set filetype=perl6
au BufNewFile,BufRead *.pm6 set filetype=perl6

highlight Search ctermfg=Black
highlight Visual ctermfg=Black
highlight DiffAdd ctermfg=Black
highlight DiffChange ctermfg=Black
highlight ColorColumn ctermfg=Black

" dbext
"let g:dbext_default_buffer_lines = 20
"let g:dbext_default_history_file = '~/.dbext_history'
"let g:dbext_default_history_size = 5000
" profiles:
"let g:dbext_default_profile_mysite = 'type=MYSQL:user=USER:passwd=PASS:dbname=MYSITE'
"let g:dbext_default_profile = 'mysite'
