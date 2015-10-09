require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    resize! if count == num_buckets
    idx = key.hash % num_buckets
    @store[idx] << key
    @count += 1
  end

  def include?(key)
    idx = key.hash % num_buckets
    @store[idx].include?(key)
  end

  def remove(key)
    idx = key.hash % num_buckets
    @store[idx].delete(key)
    @count -= 1
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    old_store = @store
    @store = Array.new(num_buckets * 2) { Array.new }
    old_store.each do |bucket|
      bucket.each do |element|
        insert(element)
      end
    end
  end
end
