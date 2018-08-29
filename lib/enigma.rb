require 'date'
require "./lib/key"
require 'pry'

class Enigma

  attr_reader :key,
              :date,
              :message

  # def initialize
  #   @key = Key.new
  # end

  def encrypt(message, key = Key.new.random_key, date = Date.today.strftime("%d%m%y"))
    @date = date
    @message = message
    # @key = Key.new(key)
  end

end
