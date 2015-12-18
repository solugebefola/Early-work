require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  attr_reader :count
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)
    if map.include?(key)
      link = map.get(key)
      update_link!(link)
      return link.val
    else
      calc!(key)
      map.get(key).val
    end
  end

  def to_s
    "Map: " + @map.to_s + "\n" + "Store: " + @store.to_s
  end

  private
  attr_reader :store, :map, :prc, :max
  def calc!(key)
    # suggested helper method; insert an (un-cached) key
    val = prc.call(key)
    store.insert(key, val)
    map.set(key, store.last)

    eject! if count > max
  end

  def update_link!(link)
    store.remove(link.key)
    store.insert(link.key, link.val)
    # suggested helper method; move a link to the end of the list
  end

  def eject!
    head = store.head
    map.delete(head.key)
    store.remove(head.key)
  end
end
