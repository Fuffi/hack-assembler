module HackAssembler
  module Assembler
    def self.scan_and_remove_labels(source_code, symbol_table)
      machine_code_line_number = 0
      label_less_code = ''
      source_code.each_line do |line|
        if is_empty_line?(line) || is_comment_line?(line)
          label_less_code << line
          next
        end

        clean_line = line.strip

        match = /\((.*)\)/.match(clean_line)
        if match
          label = match[1]

          symbol_table.add_label_address(label, machine_code_line_number)
          label_less_code << "\n"
        else
          machine_code_line_number += 1
          label_less_code << line
        end
      end

      label_less_code
    end

    def self.process_symbols(source_code, symbol_table)
      processed_code = ''
      source_code.each_line do |line|
        clean_line = line.strip

        match = /@([^0-9].*)/.match(clean_line)
        if match
          symbol = match[1]

          address = symbol_table.get_address(symbol)
          line = "@#{address}\n"
        end

        processed_code << line
      end

      processed_code
    end

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

    def self.is_label_line?(line)
      line =~ /\(.*\)/
    end
  end
end
