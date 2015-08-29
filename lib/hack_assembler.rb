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

    symbol_table = SymbolTable.new

    Assembler.scan_and_remove_labels(source_code, symbol_table)
    processed_source = Assembler.process_symbols(source_code, symbol_table)
    machine_code = Assembler.translate(processed_source)

    File.open(output_file, 'w') { |file| file.write(machine_code); file.close }

    source_file.close
  end
end
