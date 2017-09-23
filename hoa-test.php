<?php
require_once 'vendor/autoload.php';

// 1. Load grammar.
$compiler = Hoa\Compiler\Llk\Llk::load(new Hoa\File\Read('NetscapeBookmark.pp'));

// 2. Parse a data.
$ast      = $compiler->parse(file_get_contents('bookmarks.htm'));

// 3. Dump the AST.
$dump     = new Hoa\Compiler\Visitor\Dump();
echo $dump->visit($ast);
