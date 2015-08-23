module Hack2asm
  module ComputationTranslator
    def self.translate(computation)
      a_or_m_register = '0'
      if computation.include? 'M'
        a_or_m_register = '1'
      end

      generic_computation = computation.gsub(/(A|M)/, 'X')

      operation_bytecode = @@translation_table[generic_computation]
      raise ParserError if operation_bytecode.nil?

      bytecode = a_or_m_register + operation_bytecode

      bytecode
    end

    private
    @@translation_table = {
      '0' => '101010',
      'X' => '110000'
    }
  end
end
