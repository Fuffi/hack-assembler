require 'test_helper'

class JumpTranslatorTest < Minitest::Test
  def test_that_it_raises_error_on_unknown_code
    assert_raises(ParserError) { JumpTranslator.translate('ERR') }
  end

  def test_that_it_translates_null_code
    assert_equal '000', JumpTranslator.translate(nil)
  end

  def test_that_it_translates_unconditional_jump_code
    assert_equal '111', JumpTranslator.translate('JMP')
  end

  def test_that_it_translates_greater_than_zero_jump_code
    assert_equal '001', JumpTranslator.translate('JGT')
  end

  def test_that_it_translates_equals_zero_jump_code
    assert_equal '010', JumpTranslator.translate('JEQ')
  end

  def test_that_it_translates_greater_or_equals_zero_jump_code
    assert_equal '011', JumpTranslator.translate('JGE')
  end

  def test_that_it_translates_less_than_zero_jump_code
    assert_equal '100', JumpTranslator.translate('JLT')
  end

  def test_that_it_translates_not_equals_zero_jump_code
    assert_equal '101', JumpTranslator.translate('JNE')
  end

  def test_that_it_translates_less_or_equals_zero_jump_code
    assert_equal '110', JumpTranslator.translate('JLE')
  end
end
