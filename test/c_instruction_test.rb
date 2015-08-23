require 'test_helper'

class CInstructionTest < Minitest::Test
  def test_translation_of_unconditional_jump
    bytecode = ::Hack2asm::CInstruction.translate('0;JMP')
    assert_equal '1110101010000111', bytecode
  end
end
