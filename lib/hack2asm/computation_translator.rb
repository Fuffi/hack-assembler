module Hack2asm
  module ComputationTranslator
    def self.translate(computation)
      bytecode = @@translation_table[computation]
      raise ParserError if bytecode.nil?

      bytecode
    end

    private
    @@translation_table = {
      '0' => '0101010'
    }
  end
end
