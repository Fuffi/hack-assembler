require 'test_helper'

class CInstructionTest < Minitest::Test
  def test_sample
    bytecode = ::Hack2asm::CInstruction.translate('D;JNE')
    assert_equal '1110001100000101', bytecode
  end
end
