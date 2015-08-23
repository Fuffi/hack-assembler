require 'test_helper'

class AInstructionTest < Minitest::Test
  def test_that_it_converts_zero
    bytecode = AInstruction.translate('@0')
    assert_equal '0000000000000000', bytecode
  end

  def test_that_it_converts_a_positive_value
    bytecode = AInstruction.translate('@4')
    assert_equal '0000000000000100', bytecode
  end

  def test_that_it_raises_parser_error_on_symbol
    assert_raises(ParserError) { AInstruction.translate('@ERR') }
  end

  def test_that_it_raises_parser_error_on_missing_value
    assert_raises(ParserError) { AInstruction.translate('@') }
  end
end
