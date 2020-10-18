function! dnmfarrell#hashtidy#HashTidyAlignKeyPairs(startline, endline)
  let maxCol = s:HashTidyFindMaxSeparatorCol(a:startline, a:endline)
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

function! s:HashTidyFindMaxSeparatorCol(startline, endline)
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

function! dnmfarrell#hashtidy#HashTidySortKeyPairs(startline, endline)
  call s:HashTidyInsertFirstWordLength()
  while line('.') < a:endline " handle end of file
    norm j
    call s:HashTidyInsertFirstWordLength()
  endwhile
  exec ':' . a:startline . ',' . a:endline . 'sort!n'
  exec ':' . a:startline . ',' . a:endline . 's/^\d\+//e'
  exec 'normal! ' . a:startline . 'G'
endfunction

function! s:HashTidyInsertFirstWordLength()
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

function! dnmfarrell#hashtidy#HashTidySortAlignKeyPairs () range
  call dnmfarrell#hashtidy#HashTidySortKeyPairs(a:firstline, a:lastline)
  call dnmfarrell#hashtidy#HashTidyAlignKeyPairs(a:firstline, a:lastline)
endfunction

command! -range HashTidySortRange call dnmfarrell#hashtidy#HashTidySortKeyPairs(<line1>,<line2>)
command! -range HashTidyAlignRange call dnmfarrell#hashtidy#HashTidyAlignKeyPairs(<line1>,<line2>)
command! -range HashTidySortAlignRange <line1>,<line2>call dnmfarrell#hashtidy#HashTidySortAlignKeyPairs()
