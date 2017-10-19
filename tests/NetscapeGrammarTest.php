<?php
namespace Shaarli;

/**
 * Ensure the Netscape PP grammar supports all test input
 */
class NetscapeGrammarTest extends \PHPUnit\Framework\TestCase
{
    protected static $compiler;

    /**
     * Instantiate a compiler from the PP grammar
     */
    public static function setUpBeforeClass()
    {
        self::$compiler = \Hoa\Compiler\Llk\Llk::load(
            new \Hoa\File\Read('NetscapeBookmark.pp')
        );
    }

    /**
     * Parse a basic bookmark file
     */
    public function testParseBasic()
    {
        $this->assertNotNull(
            self::$compiler->parse(file_get_contents('tests/input/netscape_basic.htm'))
        );
    }

    /**
     * Parse a bookmark file with nested sections
     */
    public function testParseNested()
    {
        $this->assertNotNull(
            self::$compiler->parse(file_get_contents('tests/input/netscape_nested.htm'))
        );
    }
}
