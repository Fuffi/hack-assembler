module Hack2asm
  module JumpTranslator
    def self.translate(jump)
      bytecode = @@translation_table[jump]
      raise ParserError if bytecode.nil?

      bytecode
    end

    private
    @@translation_table = {
      nil => '000',
      'JMP' => '111'
    }
  end
end
