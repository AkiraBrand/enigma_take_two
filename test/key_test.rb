require 'minitest/autorun'
require 'minitest/pride'
require './lib/key'
require 'pry'

class KeyTest < Minitest::Test

  def test_it_exists
    key = Key.new
    assert_instance_of Key, key
  end

  def test_the_random_key_is_five_digits_long
      key = Key.new
      assert_equal 5, key.random_key.length
  end

  def test_the_given_key_stays_the_same
    #right here i believe we need to make an enigma object
    #dont forget to require enigma file at the top if so
    #try to write tests and functionality for the key part
    #of the algorithm
    # make this pass so we don't override whatever they put in
    #will probably have to write seperate method for generating
    #a random key and calling it later
    #dont forget we already solved this in enigma og 
    key = Key.new
  end

end
