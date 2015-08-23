require 'test_helper'

class ComputationTranslatorTest < Minitest::Test
  def test_that_it_raises_error_on_unknown_code
    assert_raises(ParserError) { ComputationTranslator.translate('A^2') }
  end

  def test_that_it_converts_single_register_code_for_a
    assert_equal '0110000', ComputationTranslator.translate('A')
  end

  def test_that_it_converts_single_register_code_for_m
    assert_equal '1110000', ComputationTranslator.translate('M')
  end
end
