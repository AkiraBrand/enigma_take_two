require 'date'

class Offset

  def initialize(date = Date.today.strftime("%d%m%y").to_i)
    @date= date
  end

  def date_squared
    @date ** 2
  end

  def last_four
    (@date ** 2).to_s[-4..-1]
  end

  def in_an_array
    array = last_four.chars
      array.map do |number|
        number.to_i
      end
  end

end
