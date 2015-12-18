require_relative 'p02_hashing'
require_relative 'p04_linked_list'

class HashMap
  include Enumerable

  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    bucket(key).any? { |link| link.key == key }
  end

  def set(key, val)
    resize! if count >= num_buckets
    bucket(key).insert(key, val)
    @count += 1
  end

  def get(key)
    bucket(key).get(key)
  end

  def delete(key)
    @count -= 1 if bucket(key).remove(key)
  end

  def each(&blk)

    store.each do |bucket|
      bucket.each do |link|
        blk.call(link.key, link.val)
      end
    end
  end

  # uncomment when you have Enumerable included
  def to_s
    pairs = inject([]) do |strs, (k, v)|
      strs << "#{k.to_s} => #{v.to_s}"
    end
    "{\n" + pairs.join(",\n") + "\n}"
  end

  alias_method :[], :get
  alias_method :[]=, :set

  private
  attr_reader :store

  def num_buckets
    @store.length
  end

  def resize!
    old_store = store
    @count = 0

    @store = Array.new(num_buckets * 2) { LinkedList.new }
    old_store.flatten.each do |list|
      list.each do |link|
        set(link.key, link.val)
      end
    end
  end

  def bucket(key)
    store[key.hash % num_buckets]
    # optional but useful; return the bucket corresponding to `key`
  end
end
