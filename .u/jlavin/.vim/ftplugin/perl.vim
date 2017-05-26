let b:ctags_command = "ctags -f '%f' -R --exclude='*.js' --languages=-javascript lib interchange"

setlocal keywordprg=sh\ -c\ 'perldoc\ -f\ \$1\ \|\|\ perldoc\ \$1'\ --

" syntax
vmap <leader>w !perl -Ilib -Icustom/lib -wc<CR>
nmap <leader>w :w <Bar> !clear && perl -Ilib -Icustom/lib -wc %<CR>

" run
vmap <leader>r !perl<CR>
nmap <leader>r :w <Bar> !clear && perl %<CR>

" critic
nmap <leader>c :w <Bar> !clear && perlcritic -p ~/.u/jlavin/.perlcriticrc %<CR>

command! -range=% -nargs=* Tidy <line1>,<line2>!perltidy --profile=~/.u/jlavin/.perltidyrc
noremap <F4> :Tidy<CR>

let perl_sub_signatures = 1
