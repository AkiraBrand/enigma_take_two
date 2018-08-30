require 'date'
require './lib/key'
require './lib/offset'
require 'pry'

class Enigma

  attr_reader :key,
              :date,
              :message

  def initialize
    @character_map = [*('a'..'z'), *('0'..'9'), ' ', '.',',']
  end

  def encrypt(message, key = Key.new.random_key, date = Date.today.strftime("%d%m%y"))
    @date = date
    @key = key
    @message = message
    @flip_values = final_rotation_values
    rotate_it
  end

  def slice_it
   @message.chars.each_slice(4).to_a
  end

  def final_rotation_values
    final = []
    key = Key.new(@key)
    offset = Offset.new(@date)
    final << key.key_holder[0] + offset.in_an_array[0]
    final << key.key_holder[1] + offset.in_an_array[1]
    final << key.key_holder[2] + offset.in_an_array[2]
    final << key.key_holder[3] + offset.in_an_array[3]
    return final
  end

  def rotate_it
    final_rotation_values
    slice_it.map do |block|
     block.map.with_index do |letter, index|
      initial_index = @character_map.find_index(letter)
      rotated_map = @character_map.rotate (@flip_values[index])
      rotated_map[initial_index]
    end
  end.flatten.join
  end


 def decrypt(message, key, date = Date.today.strftime("%d%m%y"))
   @date = date
   @key = key
   @message = message
   @flip_values = make_it_negative
   rotate_it
 end

 def make_it_negative
   final_rotation_values.map do |value|
     -value
   end
 end

end

# I think offset and key should be in the same test. Even though their doing their own thing now, eventually they have to work together. like adding offset and key.

# when we slice_it..."h" = message[0]. We want to some how match-up "a" rotation to index [0] too. (YEAH BUT HOW GET IT TO DO THIS...I know)
