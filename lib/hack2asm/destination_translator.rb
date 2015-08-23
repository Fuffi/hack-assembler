module Hack2asm
  module DestinationTranslator
    def self.translate(destination)
      bytecode = @@translation_table[destination]
      raise ParserError if bytecode.nil?

      bytecode
    end

    private
    @@translation_table = {
      nil => '000',
      'M' => '001',
      'D' => '010',
      'MD' => '011',
      'A' => '100',
      'AM' => '101',
      'AD' => '110',
      'AMD' => '111'
    }
  end
end
