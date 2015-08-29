require 'test_helper'

class AssemblerTest < Minitest::Test
  def test_translates_a_and_c_instructions
    source_code = "@4\n" << "0;JMP\n"
    bytecode = Assembler.translate(source_code)
    assert_equal "0000000000000100\n" << "1110101010000111\n", bytecode
  end

  def test_ignores_comments
    source_code = "// A comment\n" << "@4\n" << "// Another comment\n"
    bytecode = Assembler.translate(source_code)
    assert_equal "0000000000000100\n", bytecode
  end

  def test_ignores_empty_lines
    source_code = "\n@4\n\n"
    bytecode = Assembler.translate(source_code)
    assert_equal "0000000000000100\n", bytecode
  end

  def test_ignores_indentation_and_trailing_spaces
    source_code = "  @4  \n"
    bytecode = Assembler.translate(source_code)
    assert_equal "0000000000000100\n", bytecode
  end

  def test_that_scan_and_remove_labels_adds_labels_to_symbol_table
    symbol_table = SymbolTable.new

    source_code = "(LOOP)\n" << "@LOOP\n" << "  \n" << "(END_LOOP)\n" << "@END_LOOP\n"
    Assembler.scan_and_remove_labels(source_code, symbol_table)

    loop_address = symbol_table.get_address('LOOP')
    end_address = symbol_table.get_address('END_LOOP')

    assert_equal '0', loop_address
    assert_equal '1', end_address
  end

  def test_that_it_processes_built_in_symbols
    symbol_table = SymbolTable.new

    source_code = "@R0\n" << "@R15\n"
    processed_code = Assembler.process_symbols(source_code, symbol_table)

    assert_equal "@0\n" << "@15\n", processed_code
  end

  def test_that_it_translates_code_with_symbols_and_labels
    symbol_table = SymbolTable.new

    source_code = "(START_LOOP)\n" << "@START_LOOP\n" << "(END_LOOP)\n" << "@END_LOOP"

    label_less_code = Assembler.scan_and_remove_labels(source_code, symbol_table)

    processed_code = Assembler.process_symbols(label_less_code, symbol_table)

    bytecode = Assembler.translate(processed_code)

    assert_equal "0000000000000000\n" << "0000000000000001\n", bytecode
  end
end
