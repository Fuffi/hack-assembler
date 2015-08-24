require 'test_helper'

class HackAssemblerTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::HackAssembler::VERSION
  end
end
