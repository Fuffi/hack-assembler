require_relative 'hack2asm/version'
require_relative 'hack2asm/parser_error'
require_relative 'hack2asm/a_instruction'
require_relative 'hack2asm/computation_translator'
require_relative 'hack2asm/destination_translator'
require_relative 'hack2asm/jump_translator'
require_relative 'hack2asm/c_instruction'

module Hack2asm
  def self.translate_file(input_file: 'PongL.asm', output_file: 'out.asm')
    source_file = File.open(input_file)
    source_code = source_file.read

    source_code.each_line do |line|
      next if line.start_with?('//')

      instruction = line.start_with?('@') ? AInstruction : CInstruction
      begin
        puts instruction.translate(line.trim)
      rescue ParserError
        puts "Error parsing line: #{line}"
      end
    end

    source_file.close
  end
end
