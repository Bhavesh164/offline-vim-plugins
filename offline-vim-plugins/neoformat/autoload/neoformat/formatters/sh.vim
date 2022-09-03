function! neoformat#formatters#sh#enabled() abort
    return ['shfmt']
endfunction

function! neoformat#formatters#sh#shfmt() abort
    let opts = neoformat#utils#var_default('shfmt_opt', '')
    return {
            \ 'exe': 'shfmt',
            \ 'args': ['-i ' . (&expandtab ? shiftwidth() : 0), opts],
            \ 'stdin': 1,
            \ }
endfunction
