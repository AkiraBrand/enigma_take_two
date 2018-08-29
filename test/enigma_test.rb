require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'
require './lib/key'
require 'pry'

class EnigmaTest < Minitest::Test

  def test_it_exists
    e = Enigma.new
    assert_instance_of Enigma, e
  end

  def test_there_is_a_message
    e = Enigma.new
    assert_equal "this is so secret ..end..", e.encrypt("this is so secret ..end..")
  end

  def test_i_can_take_in_a_key
    e = Enigma.new
    e.encrypt("this is so secret ..end..", "12345")
    assert_equal "12345", e.key
  end

  def test_i_can_take_in_a_date
    e = Enigma.new
    e.encrypt("this is so secret ..end..", "12345", Date.new(2018, 8, 27))
    assert_equal Date.new(2018, 8, 27), e.date
  end

  def test_it_generates_a_random_key
    e = Enigma.new
    e.encrypt("this is so secret ..end..")
    binding.pry
    assert_equal 5, e.key.length
  end

end