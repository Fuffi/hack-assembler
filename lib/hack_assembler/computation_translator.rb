module HackAssembler
  module ComputationTranslator
    def self.translate(computation)
      a_or_m_register = '0'
      if computation.include? 'M'
        a_or_m_register = '1'
      end

      generic_computation = computation.gsub(/X/, '$').gsub(/(A|M)/, 'X')

      operation_bytecode = @@translation_table[generic_computation]
      raise ParserError if operation_bytecode.nil?

      bytecode = a_or_m_register + operation_bytecode

      bytecode
    end

    private
    @@translation_table = {
      '0' => '101010',
      '1' => '111111',
      '-1' => '111010',
      'X' => '110000',
      'D' => '001100',
      '!D' => '001101',
      '!X' => '110001',
      '-D' => '001111',
      '-X' => '110011',
      'D+1' => '011111',
      'X+1' => '110111',
      'D-1' => '001110',
      'X-1' => '110010',
      'D+X' => '000010',
      'D-X' => '010011',
      'X-D' => '000111',
      'D&X' => '000000',
      'D|X' => '010101'
    }
  end
end
