module Hack2asm
  module Assembler
    def self.translate(source_code)
      machine_code = ''

      source_code = source_code.gsub(/^[\s]*$\n/, '')

      source_code.each_line do |line|
        next if line.start_with? '//'

        instruction = line.start_with?('@') ? AInstruction : CInstruction
        machine_code << instruction.translate(line.strip) << "\n"
      end

      machine_code
    end
  end
end
