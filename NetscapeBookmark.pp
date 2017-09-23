// Netscape Bookmark grammar

// Skip extra whitespace and comments
%skip   space         \s
%skip   comment       <!--[\s\S\n]*?-->

// Generic tokens
%token  string         \w+(\s\w+)*

// Doctype
%token  doctype_       <!(?i)doctype -> doctype
%skip   doctype:space  \s
%token  doctype:string \w+(-\w+)*
%token  doctype:_t     >             -> default

// Titles
%token  title_        <(?i)title>
%token _title         </(?i)title>

%token  subtitle_     <(?i)h1>
%token _subtitle      </(?i)h1>

// Bookmark list
%token  list_         <(?i)dl><(?i)p>
%token _list          </(?i)dl><(?i)p>

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
    subtitle()
    bookmarks()

#doctype:
    ::doctype_:: <string> ::_t::

#title:
    ::title_:: <string> ::_title::

#subtitle:
    ::subtitle_:: <string> ::_subtitle::

#bookmarks:
    ::list_:: ( bookmark() | bookmarks() )* ::_list::

#bookmark:
    ::dt_:: a()

#a:
    ::a_:: attribute()* ::_a:: <string> ::_a::

#attribute:
    <name> ::value_:: <value> ::_value::
