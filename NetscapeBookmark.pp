// Netscape Bookmark grammar
%skip   space         \s

// Doctype
%token  doctype_       <!(?i)doctype -> doctype
%skip   doctype:space  \s
%token  doctype:string \w+(-\w+)*
%token  doctype:_t     >             -> default

// Document structure
#document:
    doctype()

#doctype:
    ::doctype_:: <string> ::_t::
