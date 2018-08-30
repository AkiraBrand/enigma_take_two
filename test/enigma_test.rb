require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'
require './lib/key'
require './lib/offset'
require 'pry'

class EnigmaTest < Minitest::Test

  def test_it_exists
    e = Enigma.new
    assert_instance_of Enigma, e
  end

  def test_there_is_a_message
    e = Enigma.new
    e.encrypt("this is so secret ..end..")
    assert_equal "this is so secret ..end..", e.message
  end

  def test_i_can_take_in_a_key
    e = Enigma.new
    e.encrypt("this is so secret ..end..", "12345")
    assert_equal "12345", e.key
  end

  def test_i_can_take_in_a_date
    e = Enigma.new
    e.encrypt("this is so secret ..end..", "12345", 290818)
    assert_equal 290818, e.date
  end

  def test_it_generates_a_random_key
    e = Enigma.new
    e.encrypt("this is so secret ..end..")
    assert_equal 5, e.key.length
  end

  def test_it_does_not_override_given_key_or_date
    e = Enigma.new
    e.encrypt("this is so secret ..end..", "34567", 290818)
    assert_equal "34567", e.key
  end

  def test_it_will_seperate_the_message_into_four_characters
     e = Enigma.new
     e.encrypt("hello")
     assert_equal [["h", "e", "l", "l"], ["o"]] , e.slice_it
  end

  def test_it_has_a_final_rotation_array
   e = Enigma.new
   e.encrypt("hello", "12345", 290818)
   assert_equal [21, 24, 36, 49], e.final_rotation_values
  end

  def test_it_can_encrypt_one_letter
    e = Enigma.new
    actual = e.encrypt("a", "12345", 290818)
    assert_equal'v', actual
  end

  def test_it_can_decrypt_one_letter
    e = Enigma.new
    actual = e.decrypt("v", "12345", 290818)
    assert_equal'a', actual
  end

end
