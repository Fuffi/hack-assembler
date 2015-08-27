require 'test_helper'

class SymbolTableTest < Minitest::Test
  def setup
    @symbol_table = SymbolTable.new
  end

  def test_that_adds_one_variable_symbol
    address = @symbol_table.get_address('index')
    assert_equal '16', address
  end

  def test_that_adds_two_variable_symbols
    @symbol_table.get_address('index')
    address = @symbol_table.get_address('count')
    assert_equal '17', address
  end

  def test_that_addresses_dont_change
    @symbol_table.get_address('index')
    @symbol_table.get_address('count')
    address = @symbol_table.get_address('index')
    assert_equal '16', address
  end

  def test_add_one_label_address
    @symbol_table.add_label_address('END', 32)
    address = @symbol_table.get_address('END')
    assert '32', address
  end

  def test_reserved_symbol_r0
    address = @symbol_table.get_address('R0')
    assert_equal '0', address
  end

  def test_reserved_symbol_r1
    address = @symbol_table.get_address('R1')
    assert_equal '1', address
  end

  def test_reserved_symbol_r2
    address = @symbol_table.get_address('R2')
    assert_equal '2', address
  end

  def test_reserved_symbol_r3
    address = @symbol_table.get_address('R3')
    assert_equal '3', address
  end

  def test_reserved_symbol_r4
    address = @symbol_table.get_address('R4')
    assert_equal '4', address
  end

  def test_reserved_symbol_r5
    address = @symbol_table.get_address('R5')
    assert_equal '5', address
  end

  def test_reserved_symbol_r6
    address = @symbol_table.get_address('R6')
    assert_equal '6', address
  end

  def test_reserved_symbol_r7
    address = @symbol_table.get_address('R7')
    assert_equal '7', address
  end

  def test_reserved_symbol_r8
    address = @symbol_table.get_address('R8')
    assert_equal '8', address
  end

  def test_reserved_symbol_r9
    address = @symbol_table.get_address('R9')
    assert_equal '9', address
  end

  def test_reserved_symbol_r10
    address = @symbol_table.get_address('R10')
    assert_equal '10', address
  end

  def test_reserved_symbol_r11
    address = @symbol_table.get_address('R11')
    assert_equal '11', address
  end

  def test_reserved_symbol_r12
    address = @symbol_table.get_address('R12')
    assert_equal '12', address
  end

  def test_reserved_symbol_r13
    address = @symbol_table.get_address('R13')
    assert_equal '13', address
  end

  def test_reserved_symbol_r14
    address = @symbol_table.get_address('R14')
    assert_equal '14', address
  end

  def test_reserved_symbol_r15
    address = @symbol_table.get_address('R15')
    assert_equal '15', address
  end

  def test_reserved_symbol_screen
    address = @symbol_table.get_address('SCREEN')
    assert_equal '16384', address
  end

  def test_reserved_symbol_kbd
    address = @symbol_table.get_address('KBD')
    assert_equal '24576', address
  end

  def test_reserved_symbol_sp
    address = @symbol_table.get_address('SP')
    assert_equal '0', address
  end

  def test_reserved_symbol_lcl
    address = @symbol_table.get_address('LCL')
    assert_equal '1', address
  end

  def test_reserved_symbol_arg
    address = @symbol_table.get_address('ARG')
    assert_equal '2', address
  end

  def test_reserved_symbol_this
    address = @symbol_table.get_address('THIS')
    assert_equal '3', address
  end

  def test_reserved_symbol_that
    address = @symbol_table.get_address('THAT')
    assert_equal '4', address
  end
end
