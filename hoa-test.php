<?php
require_once 'vendor/autoload.php';

// Load PP grammar
$compiler = Hoa\Compiler\Llk\Llk::load(new Hoa\File\Read('NetscapeBookmark.pp'));

// Parse data
$ast = $compiler->parse(file_get_contents('tests/input/netscape_nested.htm'));

// Dump the AST
$dump     = new Hoa\Compiler\Visitor\Dump();
echo $dump->visit($ast);
