require 'test_helper'

class DestinationTranslatorTest < Minitest::Test
  def test_that_it_raises_error_on_unknown_code
    assert_raises(ParserError) { DestinationTranslator.translate('ADZ') }
  end

  def test_that_it_translates_null_destination_code
    assert_equal '000', DestinationTranslator.translate(nil)
  end

  def test_that_it_translates_m_destination_code
    assert_equal '001', DestinationTranslator.translate('M')
  end

  def test_that_it_translates_d_destination_code
    assert_equal '010', DestinationTranslator.translate('D')
  end

  def test_that_it_translates_md_destination_code
    assert_equal '011', DestinationTranslator.translate('MD')
  end

  def test_that_it_translates_a_destination_code
    assert_equal '100', DestinationTranslator.translate('A')
  end

  def test_that_it_translates_am_destination_code
    assert_equal '101', DestinationTranslator.translate('AM')
  end

  def test_that_it_translates_ad_destination_code
    assert_equal '110', DestinationTranslator.translate('AD')
  end

  def test_that_it_translates_amd_destination_code
    assert_equal '111', DestinationTranslator.translate('AMD')
  end
end
