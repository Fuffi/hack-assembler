module HackAssembler
  module Assembler
    def self.translate(source_code)
      machine_code = ''

      source_code_extract = source_code.gsub(/^[\s]*$\n/, '')

      source_code_extract.each_line do |line|
        next if line.start_with? '//'
        
        clean_line = line.strip

        instruction = clean_line.start_with?('@') ? AInstruction : CInstruction

        machine_code << instruction.translate(clean_line) << "\n"
      end

      machine_code
    end
  end
end
