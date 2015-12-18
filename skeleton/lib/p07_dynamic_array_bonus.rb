class StaticArray
  def initialize(capacity)
    @store = Array.new(capacity)
  end

  def [](i)
    validate!(i)
    @store[i]
  end

  def []=(i, val)
    validate!(i)
    @store[i] = val
  end

  private

  def validate!(i)
    raise "Overflow error" unless i.between?(0, @store.length - 1)
  end
end

class DynamicArray
  include Enumerable

  attr_reader :count, :capacity

  def initialize(capacity = 8)
    @store = StaticArray.new(capacity)
    @count = 0
    @capacity = capacity
  end

  def [](i)
    i += count if i < 0
    store[i]
  rescue
    nil
  end

  def []=(i, val)
    i += count if i < 0
    while i > capacity
      resize!
    end

    @count = i + 1 if i >= @count

    store[i] = val
  end


  def include?(val)
    i = 0
    while i < capacity
      return true if store[i] == val
      i += 1
    end
    false
  end

  def push(val)
    resize! if count == capacity
    store[count] = val
    @count += 1
  end

  def unshift(val)
    resize! if count == capacity

    i = count - 1
    while i >= 0
      store[i + 1] = store[i]
      i -= 1
    end

    store[0] = val
    @count += 1
  end

  def pop
    return nil if count == 0
    element = store[count - 1]
    store[count - 1] = nil
    @count -= 1
    element
  end

  def shift
    return nil if count == 0
    element = store[0]

    i = 1
    while i < count
      store[i - 1] = store[i]
      i += 1
    end

    store[count - 1] = nil
    @count -= 1
    element
  end

  def first
    store[0]
  end

  def last
    store[count - 1]
  end

  def each(&blk)
    i = 0
    while i < capacity
      blk.call(store[i]) unless store[i].nil?
      i += 1
    end
    self
  end

  def to_s
    "[" + inject([]) { |acc, el| acc << el }.join(", ") + "]"
  end

  def ==(other)
    return false unless [Array, DynamicArray].include?(other.class)
    # ...
    # return false unless count == other.count
    i = 0

    while i < capacity
      return false unless self[i] == other[i]
      i += 1
    end

    true
  end

  alias_method :<<, :push
  [:length, :size].each { |method| alias_method method, :count }

  private
  attr_reader :store

  def resize!
    old_store = store

    @store = StaticArray.new(capacity * 2)
    i = 0
    while i < capacity
      @store[i] = old_store[i]
      i += 1
    end

    @capacity *= 2
  end
end
