require 'test_helper'

class SymbolTableTest < Minitest::Test
  def test_that_adds_one_symbol
    address = SymbolTable.get_address('index')
    assert_equal '16', address
  end

  def test_that_adds_two_symbols
    SymbolTable.get_address('index')
    address = SymbolTable.get_address('count')
    assert_equal '17', address
  end

  def test_that_addresses_dont_change
    SymbolTable.get_address('index')
    SymbolTable.get_address('count')
    address = SymbolTable.get_address('index')
    assert_equal '16', address
  end

  def test_reserved_symbol_r0
    address = SymbolTable.get_address('R0')
    assert_equal '0', address
  end

  def test_reserved_symbol_r1
    address = SymbolTable.get_address('R1')
    assert_equal '1', address
  end

  def test_reserved_symbol_r2
    address = SymbolTable.get_address('R2')
    assert_equal '2', address
  end

  def test_reserved_symbol_r3
    address = SymbolTable.get_address('R3')
    assert_equal '3', address
  end

  def test_reserved_symbol_r4
    address = SymbolTable.get_address('R4')
    assert_equal '4', address
  end

  def test_reserved_symbol_r5
    address = SymbolTable.get_address('R5')
    assert_equal '5', address
  end

  def test_reserved_symbol_r6
    address = SymbolTable.get_address('R6')
    assert_equal '6', address
  end

  def test_reserved_symbol_r7
    address = SymbolTable.get_address('R7')
    assert_equal '7', address
  end

  def test_reserved_symbol_r8
    address = SymbolTable.get_address('R8')
    assert_equal '8', address
  end

  def test_reserved_symbol_r9
    address = SymbolTable.get_address('R9')
    assert_equal '9', address
  end

  def test_reserved_symbol_r10
    address = SymbolTable.get_address('R10')
    assert_equal '10', address
  end

  def test_reserved_symbol_r11
    address = SymbolTable.get_address('R11')
    assert_equal '11', address
  end

  def test_reserved_symbol_r12
    address = SymbolTable.get_address('R12')
    assert_equal '12', address
  end

  def test_reserved_symbol_r13
    address = SymbolTable.get_address('R13')
    assert_equal '13', address
  end

  def test_reserved_symbol_r14
    address = SymbolTable.get_address('R14')
    assert_equal '14', address
  end

  def test_reserved_symbol_r15
    address = SymbolTable.get_address('R15')
    assert_equal '15', address
  end

  def test_reserved_symbol_screen
    address = SymbolTable.get_address('SCREEN')
    assert_equal '16384', address
  end

  def test_reserved_symbol_kbd
    address = SymbolTable.get_address('KBD')
    assert_equal '24576', address
  end

  def test_reserved_symbol_sp
    address = SymbolTable.get_address('SP')
    assert_equal '0', address
  end

  def test_reserved_symbol_lcl
    address = SymbolTable.get_address('LCL')
    assert_equal '1', address
  end

  def test_reserved_symbol_arg
    address = SymbolTable.get_address('ARG')
    assert_equal '2', address
  end

  def test_reserved_symbol_this
    address = SymbolTable.get_address('THIS')
    assert_equal '3', address
  end

  def test_reserved_symbol_that
    address = SymbolTable.get_address('THAT')
    assert_equal '4', address
  end
end
