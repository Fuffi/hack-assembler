module Hack2asm
  module ComputationTranslator
    def self.translate(computation)
      bytecode = @@translation_table[computation]
      raise ParserError if bytecode.nil?

      bytecode
    end

    private
    @@translation_table = {
      'D' => '0001100'
    }
  end
end
