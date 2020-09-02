function! HashTidyAlignKeyPairs(startline, endline)
  let maxCol = HashTidyFindMaxSeparatorCol(a:startline, a:endline)
  exec 'normal! ' . a:startline . 'G1|w'
  norm 1|f=
  let whitespace = repeat(' ', maxCol - col('.'))
  exec ':normal! i' . whitespace
  while line('.') < a:endline
    norm j1|f=
    let whitespace = repeat(' ', maxCol - col('.'))
    exec ':normal! i' . whitespace
  endwhile
  exec 'normal! ' . a:startline . 'G1|w'
endfunction

function! HashTidyFindMaxSeparatorCol(startline, endline)
  exec 'normal! ' . a:startline . 'G1|w'
  norm 1|f=
  let maxCol = col('.')
  while line('.') < a:endline
    norm j1|f=
    if col('.') > maxCol
      let maxCol = col('.')
    endif
  endwhile
  return maxCol
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
  let startCol = col('.')
  let firstChar = getline('.')[startCol-1]
  if firstChar == "'" || firstChar == '"'
    exec 'normal! f' . firstChar
    let wordlen = col('.') - startCol + 1
  else
    let wordlen = len(expand('<cword>'))
  endif
  norm 1|
  exec 'normal! i' . wordlen
endfunction

function! HashTidySortAlignKeyPairs () range
  call HashTidySortKeyPairs(a:firstline, a:lastline)
  call HashTidyAlignKeyPairs(a:firstline, a:lastline)
endfunction

command! -range HashTidySortRange call HashTidySortKeyPairs(<line1>,<line2>)
command! -range HashTidyAlignRange call HashTidyAlignKeyPairs(<line1>,<line2>)
command! -range HashTidySortAlignRange <line1>,<line2>call HashTidySortAlignKeyPairs()
