module HackAssembler
  class SymbolTable
    def initialize
      @num_variable_symbols = 0

      @symbol_table = {
        'R0' => '0',
        'R1' => '1',
        'R2' => '2',
        'R3' => '3',
        'R4' => '4',
        'R5' => '5',
        'R6' => '6',
        'R7' => '7',
        'R8' => '8',
        'R9' => '9',
        'R10' => '10',
        'R11' => '11',
        'R12' => '12',
        'R13' => '13',
        'R14' => '14',
        'R15' => '15',
        'SCREEN' => '16384',
        'KBD' => '24576',
        'SP' => '0',
        'LCL' => '1',
        'ARG' => '2',
        'THIS' => '3',
        'THAT' => '4'
      }
    end

    def get_address(symbol)
      address = @symbol_table[symbol]
      if address.nil?
        address =  (16 + @num_variable_symbols).to_s
        @symbol_table[symbol] = address
        @num_variable_symbols += 1
      end

      address
    end

    def add_label_address(symbol, address)
      @symbol_table[symbol] = address.to_s
    end
  end
end
