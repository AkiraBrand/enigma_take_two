require 'minitest/autorun'
require 'minitest/pride'
require './lib/offset'
require './lib/key'
require './lib/enigma'
require 'pry'

class OffsetTest < Minitest::Test

  def test_it_exists
    offset = Offset.new
    assert_instance_of Offset, offset
  end

  def test_the_last_four_method
    offset = Offset.new
    assert_equal "9124", offset.last_four
  end

  def test_it_puts_the_offset_into_an_array
    offset = Offset.new
    assert_equal [9, 1, 2, 4], offset.in_an_array
  end

end
