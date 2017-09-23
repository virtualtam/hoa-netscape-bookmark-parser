// Netscape Bookmark grammar

// Skip extra whitespace and comments
%skip   space         \s
%skip   comment       <!--[\s\S\n]*?-->
%skip   meta          <META [\s\S]*?>

// Generic tokens
%token  string        \w+(\s*\w*\p{P}*)*

// Doctype
%token  doctype_       <!(?i)doctype -> doctype
%skip   doctype:space  \s
%token  doctype:string \w+(-\w+)*
%token  doctype:_t     >             -> default

// Titles
%token  title_        <(?i)title>
%token _title         </(?i)title>

%token  h1_           <(?i)h1>
%token _h1            </(?i)h1>

// Bookmark list
%token  dl_           <(?i)dl><(?i)p>
%token _dl            </(?i)dl><(?i)p>

// Bookmark entry
%token  dt_           <(?i)dt>
%token  dd_           <(?i)dd>

%token  a_            <(?i)a         -> a
%skip   a:space       \s
%token  a:name        \w+
%token  a:value_      ="             -> v
%token  v:value       [^"]+
%token  v:_value      "              -> a
%token  a:_a          >              -> default
%token _a             </(?i)a>

// Document structure
#document:
    doctype()
    title()
    h1()
    bookmarks()

#doctype:
    ::doctype_:: <string> ::_t::

#title:
    ::title_:: <string> ::_title::

#h1:
    ::h1_:: <string> ::_h1::

#bookmarks:
    ::dl_:: ( bookmark() | bookmarks() )* ::_dl::

#bookmark:
    ::dt_:: a() dd()?

#a:
    ::a_:: attribute()* ::_a:: <string> ::_a::

#attribute:
    <name> ::value_:: <value> ::_value::

#dd:
    ::dd_:: <string>
