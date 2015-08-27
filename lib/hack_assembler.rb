require_relative 'hack_assembler/version'
require_relative 'hack_assembler/parser_error'
require_relative 'hack_assembler/a_instruction'
require_relative 'hack_assembler/computation_translator'
require_relative 'hack_assembler/destination_translator'
require_relative 'hack_assembler/jump_translator'
require_relative 'hack_assembler/c_instruction'
require_relative 'hack_assembler/assembler'
require_relative 'hack_assembler/symbol_table'

module HackAssembler
  def self.translate_file(input_file, output_file)
    source_file = File.open(input_file)
    source_code = source_file.read

    machine_code = Assembler.translate(source_code)

    File.open(output_file, 'w') { |file| file.write(machine_code); file.close }

    source_file.close
  end
end
