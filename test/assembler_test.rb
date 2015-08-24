require 'test_helper'

class AssemblerTest < Minitest::Test
  def test_translates_a_and_c_instructions
    source_code = "@4\n" << "0;JMP\n"
    bytecode = Assembler.translate(source_code)
    assert_equal "0000000000000100\n" << "1110101010000111\n", bytecode
  end

  def test_ignores_empty_lines
    source_code = "\n@4\n"
    bytecode = Assembler.translate(source_code)
    assert_equal "0000000000000100\n", bytecode
  end
end
