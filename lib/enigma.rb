require 'date'

class Enigma

  attr_reader :key,
              :date

  def encrypt(message, key = Key.new.random, date = Date.new)
    @key = key
    @date = date
    @message = message
  end

end
