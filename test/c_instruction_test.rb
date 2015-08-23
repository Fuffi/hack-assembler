require 'test_helper'

class CInstructionTest < Minitest::Test
  def test_translation_of_unconditional_jump
    bytecode = CInstruction.translate('0;JMP')
    assert_equal '1110101010000111', bytecode
  end

  def test_that_computation_translator_writes_on_output
    bytecode = nil
    ComputationTranslator.stub(:translate, '0000000') do
      bytecode = CInstruction.translate('0;JMP')
    end

    assert_equal '1110000000000111', bytecode
  end
end
