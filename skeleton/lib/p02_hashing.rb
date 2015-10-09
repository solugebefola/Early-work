ARRAY_PREFIX =  '2'
STRING_PREFIX = '3'
HASH_PREFIX =   '4'

class Fixnum
  # Fixnum#hash already implemented for you
  def hash
    self
  end
end

class Array
  def hash
    return 0 if empty?
    (ARRAY_PREFIX + map(&:hash).join).to_i
  end
end

class String
  def hash
    (STRING_PREFIX + split('').map(&:ord).map(&:hash).join).to_i
  end
end

class Hash
  def hash
    (HASH_PREFIX + map do |k, v|
      k.to_s.hash.to_s + v.to_s.hash.to_s
    end.sort.join).to_i
  end
end
