Hash-Tidy
---------
Fight entropy and disorder! Tidy your Perl hashes in vim.

It can sort keys by length:

![](hash-tidy-sort-only.gif)

It can align fat arrows:

![](hash-tidy-align-only.gif)

Or do both:

![](hash-tidy-sort-align.gif)

Installation
------------
This assumes you have Vim's builtin [filetype plugin option](http://vimdoc.sourceforge.net/htmldoc/filetype.html#:filetype-plugin-on)
enabled. (e.g. something like `filetype plugin on` in your `.vimrc`).

To install as a plugin, save `plugin/hash-tidy.vim` to
`~/.vim/plugin/hash-tidy.vim`.

Next map shortcuts to run the routines. As this plugin works on Perl hashes,
you might put this code in `~/.vim/ftplugin/perl.vim`:

```
vnoremap <buffer> <localleader>a :HashTidyAlignRange<cr>
vnoremap <buffer> <localleader>s :HashTidySortRange<cr>
vnoremap <buffer> <localleader>sa :HashTidySortAlignRange<cr>
```

In visual mode these map the shortcuts `leader` + s to sort, `leader` + a
to align and `leader` + sa to sort and align.

Alternatively append all of this code to `~/.vim/ftplugin/perl.vim`.

License
-------
Copyright 2020 David Farrell

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
of the Software, and to permit persons to whom the Software is furnished to do
so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
