class Key
attr_reader :random
 def initialize
  @random = rand(00000..99999).to_s.rjust(5, '0')
 end

end
