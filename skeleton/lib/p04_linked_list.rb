class Link
  attr_accessor :key, :val, :next

  def initialize(key = nil, val = nil, nxt = nil)
    @key, @val, @next = key, val, nxt
  end

  def to_s
    "#{@key}, #{@val}"
  end
end

class LinkedList
  include Enumerable

  attr_reader :head

  def initialize
    @head = nil
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    head
  end

  def last
    each { |link| return link if link.next.nil? }
  end

  def empty?
    head.nil?
  end

  def get(key)
    each { |link| return link.val if link.key == key }
    nil
  end

  def include?(key)
    !!get(key)
  end

  def insert(key, val)
    if head.nil?
      @head = Link.new(key, val, nil)
    else
      last.next = Link.new(key, val, nil)
    end
  end

  def remove(key)
    previous= nil
    each do |link|
      unless link.key == key
        previous = link
        next
      end

      if previous.nil?
        @head = head.next
      else
        previous.next = link.next
      end

      return
    end
  end

  def each(&blk)
    current_link = head
    until current_link.nil?
      blk.call(current_link)
      current_link = current_link.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
