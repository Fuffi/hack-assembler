module Hack2asm
  module DestinationTranslator
    def self.translate(destination)
      bytecode = @@translation_table[destination]
      raise ParserError if bytecode.nil?

      bytecode
    end

    private
    @@translation_table = {
      nil => '000'
    }
  end
end
