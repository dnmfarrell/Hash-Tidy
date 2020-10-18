" Vim filetype plugin file for HashTidy
" Languages:          Perl, Raku
" Project Repository: https://github.com/dnmfarrell/Hash-Tidy

" Note: ignore b:did_ftplugin since our changes are in addition to changes
"       other Perl or Raku plugins might make.

command! -range HashTidySortRange call dnmfarrell#hashtidy#HashTidySortKeyPairs(<line1>,<line2>)
command! -range HashTidyAlignRange call dnmfarrell#hashtidy#HashTidyAlignKeyPairs(<line1>,<line2>)
command! -range HashTidySortAlignRange <line1>,<line2>call dnmfarrell#hashtidy#HashTidySortAlignKeyPairs()
