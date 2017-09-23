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


// Document structure
#document:
    doctype()
    title()
    subtitle()

#doctype:
    ::doctype_:: <string> ::_t::

#title:
    ::title_:: <string> ::_title::

#subtitle:
    ::subtitle_:: <string> ::_subtitle::
