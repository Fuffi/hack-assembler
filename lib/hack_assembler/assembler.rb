module HackAssembler
  module Assembler
    def self.translate(source_code)
      machine_code = ''

      source_code.each_line do |line|
        next if is_empty_line?(line) || is_comment_line?(line)

        clean_line = line.strip

        instruction = clean_line.start_with?('@') ? AInstruction : CInstruction

        machine_code << instruction.translate(clean_line) << "\n"
      end

      machine_code
    end

    private
    def self.is_empty_line?(line)
      line =~ /^[\s]*$\n/
    end

    def self.is_comment_line?(line)
      line.start_with? '//'
    end
  end
end
