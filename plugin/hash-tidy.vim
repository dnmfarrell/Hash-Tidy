function! HashTidyAlignKeyPairs(startline, endline)
  norm 1|f=
  let startCol = col('.')
  while line('.') < a:endline
    norm j1|f=
    let whitespace = repeat(' ', startCol - col('.'))
    exec ':normal! i' . whitespace
  endwhile
  exec 'normal! ' . a:startline . 'G1|w'
endfunction

function! HashTidySortKeyPairs(startline, endline)
  call HashTidyInsertFirstWordLength()
  while line('.') < a:endline " handle end of file
    norm j
    call HashTidyInsertFirstWordLength()
  endwhile
  exec ':' . a:startline . ',' . a:endline . 'sort!n'
  exec ':' . a:startline . ',' . a:endline . 's/^\d\+//e'
  exec 'normal! ' . a:startline . 'G'
endfunction

function! HashTidyInsertFirstWordLength()
  norm 1|w
  let wordlen=len(expand('<cWORD>'))
  norm 1|
  exec 'normal! i' . wordlen
endfunction

function! HashTidySortAlignKeyPairs () range
  call HashTidySortKeyPairs(a:firstline, a:lastline)
  call HashTidyAlignKeyPairs(a:firstline, a:lastline)
endfunction

command! -range HashTidySortRange call HashTidySortKeyPairs(<line1>,<line2>)
command! -range HashTidySortAlignRange <line1>,<line2>call HashTidySortAlignKeyPairs()
