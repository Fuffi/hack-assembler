require 'test_helper'

class Hack2asmTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Hack2asm::VERSION
  end
end