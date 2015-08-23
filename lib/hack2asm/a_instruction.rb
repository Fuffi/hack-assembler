module Hack2asm
  module AInstruction
    def self.translate(hack_instruction)
      matched = /@([0-9]+)/.match(hack_instruction)
      raise ParserError if matched.nil?

      value = matched[1].to_i
      binary_value = value.to_s(2)
      padded_binary_value = binary_value.rjust(16, '0')

      padded_binary_value
    end
  end
end
