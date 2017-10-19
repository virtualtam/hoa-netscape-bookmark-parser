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

%token  h3_           <(?i)h3         -> h3
%skip   h3:space      \s
%token  h3:name       \w+
%token  h3:value_     ="              -> h3v
%token  h3v:value     [^"]+
%token  h3v:_value    "               -> h3
%token  h3:_h3        >               -> default
%token _h3            </(?i)h3>

// Bookmark list
%token  dl_           <(?i)dl><(?i)p>
%token _dl            </(?i)dl><(?i)p>

// Bookmark entry
%token  dt_           <(?i)dt>
%token  dd_           <(?i)dd>

%token  a_            <(?i)a         -> a
%skip   a:space       \s
%token  a:name        \w+
%token  a:value_      ="             -> av
%token  av:value      [^"]+
%token  av:_value     "              -> a
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
    ::dl_:: ( bookmark() | section() bookmarks() )* ::_dl::

#bookmark:
    ::dt_:: a() dd()?

#section:
    ::dt_:: h3() dd()?

#a:
    ::a_:: attribute()* ::_a:: <string> ::_a::

#h3:
    ::h3_:: attribute()* ::_h3:: <string> ::_h3::

#attribute:
    <name> ::value_:: <value> ::_value::

#dd:
    ::dd_:: <string>
