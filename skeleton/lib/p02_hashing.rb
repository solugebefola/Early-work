ARRAY_PREFIX =  '2'
STRING_PREFIX = '3'
HASH_PREFIX =   '4'

class Fixnum
  # Fixnum#hash already implemented for you
  # def hash
  #   self
  # end
end

class Array
  def hash
    element_hashes = self.map.with_index do |el, idx|
      el.hash.abs.to_s + idx.to_s
    end
    (ARRAY_PREFIX + element_hashes.join).to_i
  end
end

class String
  def hash
    (STRING_PREFIX + split('').map { |el| el.ord.hash.abs }.join).to_i
  end
end

class Hash
  def hash
    (HASH_PREFIX + map do |k, v|
      k.to_s.hash.to_s + v.to_s.hash.to_s
    end.sort.join).to_i
  end
end
