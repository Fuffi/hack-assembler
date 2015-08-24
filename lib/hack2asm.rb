require_relative 'hack2asm/version'
require_relative 'hack2asm/parser_error'
require_relative 'hack2asm/a_instruction'
require_relative 'hack2asm/computation_translator'
require_relative 'hack2asm/destination_translator'
require_relative 'hack2asm/jump_translator'
require_relative 'hack2asm/c_instruction'
require_relative 'hack2asm/assembler'

module Hack2asm
  def self.translate_file(input_file: 'PongL.asm', output_file: 'out.hack')
    source_file = File.open(input_file)
    source_code = source_file.read
    source_code = source_code.gsub(/^[\s]*$\n/, '')

    machine_code = Assembler.translate(source_code)

    File.open(output_file, 'w') { |file| file.write(machine_code); file.close }

    source_file.close
  end
end
