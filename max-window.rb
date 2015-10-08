def windowed_max_range(arr, window) #O(n * w)?
  current_max_range = nil
  (arr.count - window + 1).times do |idx|
    slice = arr[idx..idx + window - 1]
    min = slice.min
    max = slice.max
    range = max-min
    current_max_range ||= range
    current_max_range = range if range > current_max_range
  end
  current_max_range
end


def queue_max_range(arr, window)
  disp_arr = arr.dup
  queue = StackQueue.new

  window.times do
    queue.enqueue(disp_arr.pop)
  end

  max_range = queue.max - queue.min

  until disp_arr.empty?
    queue.enqueue(disp_arr.pop)
    queue.dequeue
    current_range = (queue.max - queue.min)
    max_range = current_range if current_range > max_range
  end

  max_range
end

class StackElement
  attr_reader :val, :min, :max

  def initialize(val, min, max)
    @val = val
    min ||= val
    max ||= val
    @min = val < min ? val : min
    @max = val > max ? val : max
  end
end

class MyStack
  def initialize
    #each store element is { value => [min, max] }
    @store = []

  end

  def pop
    return nil if empty?
    @store.pop.val
  end

  def push(el)
    @store.push(StackElement.new(el, min, max))
  end

  def peek
    @store.last.val
  end

  def empty?
    @store.empty?
  end

  def max
    return nil if empty?
    @store.last.max
  end

  def min
    return nil if empty?
    @store.last.min
  end

  def size
    @store.size
  end


end

class StackQueue
  def initialize
    @in_stack = MyStack.new
    @out_stack = MyStack.new
  end

  def enqueue(element)
    @in_stack.push(element)
  end

  def dequeue()
    return nil if empty?
    if @out_stack.empty?
      fill_out_stack
    end
    @out_stack.pop
  end

  def fill_out_stack
    until @in_stack.empty?
      @out_stack.push(@in_stack.pop)
    end
  end

  def size
    @in_stack.size + @out_stack.size
  end

  def empty?
    size.zero?
  end

  def min
    [@in_stack.min, @out_stack.min].compact.min
  end

  def max
    [@in_stack.max, @out_stack.max].compact.max
  end

end
