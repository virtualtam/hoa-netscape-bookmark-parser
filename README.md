# hoa-netscape-grammar
## Experiment scope
Netscape Bookmark Lexer/Parser experiment using [`Hoa\Compiler`](https://hoa-project.net/En/Literature/Hack/Compiler.html)

This project aims at rewriting the [Netscape Bookmark Parser](https://github.com/shaarli/netscape-bookmark-parser)
used by [Shaarli](https://github.com/shaarli/Shaarli) to import bookmarks from other services,
using a proper grammar instead of tedious file sanitizing and linear parsing.

See https://github.com/shaarli/netscape-bookmark-parser/issues/41

## Resources
Documentation:
- https://hoa-project.net/En/Literature/Hack/Compiler.html

`Hoa\Compiler` PP grammars:
- https://github.com/hoaproject/Json/blob/master/Grammar.pp
- https://github.com/hoaproject/Math/blob/master/Arithmetic.pp
- https://github.com/hoaproject/Ruler/blob/master/Grammar.pp

PCRE:
- https://stackoverflow.com/questions/6804951/regex-to-remove-comments-in-xml-file-in-eclipse-java
- https://superuser.com/questions/1153239/regex-to-match-xml-comments
