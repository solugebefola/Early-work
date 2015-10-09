class MaxIntSet
  def initialize(max)
    @store = Array.new(max, false)
  end

  def insert(num)
    validate!(num)
    store[num] = true
  end

  def remove(num)
    validate!(num)
    store[num] = false
  end

  def include?(num)
    validate!(num)
    store[num]
  end

  private

  attr_reader :store

  def is_valid?(num)
    num < max && num >= 0
  end

  def validate!(num)
    raise "Out of bounds" unless is_valid?(num)
  end

  def max
    store.length
  end
end



class IntSet
  def initialize(num_buckets)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    i = num % num_buckets
    @store[i] << num
  end

  def remove(num)
    i = num % num_buckets
    @store[i].delete(num)
  end

  def include?(num)
    i = num % num_buckets
    @store[i].include?(num)
  end

  private

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  def initialize(num_buckets)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    resize! if size == count
    i = num % size
    store[i] << num
    @count += 1
  end

  def remove(num)
    i = num % size
    store[i].delete(num)
  end

  def include?(num)
    i = num % size
    store[i].include?(num)
  end

  def size
    store.size
  end

  def resize!
    old_store = store
    @count = 0
    @store = Array.new(size * 2) { Array.new }
    old_store.each do |bucket|
      bucket.each do |element|
        insert(element)
      end
    end
  end

  attr_reader :store, :count
end
