module HackAssembler
  module CInstruction
    def self.translate(instruction)
      matched = /((.+)=)?([^;]+)(;([A-Z]+))?/.match(instruction)
      destination = matched[2]
      computation = matched[3]
      jump = matched[5]

      bytecode = '1110000000000000'
      bytecode[3..9] = ComputationTranslator.translate(computation)
      bytecode[10..12] = DestinationTranslator.translate(destination)
      bytecode[13..15] = JumpTranslator.translate(jump)

      bytecode
    end
  end
end
