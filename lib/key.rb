class Key
attr_reader :random_key,
            :key_string

def initialize(key = random_key)
  @key_string = key
end

 def random_key
  @random = rand(00000..99999).to_s.rjust(5, '0')
 end

 def key_holder
   held_keys = []
   held_keys << @key_string.chars.join[0..1].to_i
   held_keys << @key_string.chars.join[1..2].to_i
   held_keys << @key_string.chars.join[2..3].to_i
   held_keys << @key_string.chars.join[3..4].to_i
 end


end
