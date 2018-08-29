require 'date'
require "./lib/key"

class Enigma

  attr_reader :key,
              :date,
              :message

  def initialize

  end

  def encrypt(message, key = Key.new.random, date = Date.today.strftime("%e%m%y"))
    @key = key
    @date = date
    @message = message
  end
end
