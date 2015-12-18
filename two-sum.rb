require 'benchmark'

def bad_two_sum?(nums, target) #O(n^2)
  nums.each.with_index do |num1, idx|
    nums[(idx + 1)..-1].each do |num2|
      return true if num1 + num2 == target
    end
  end
  false
end

def ok_two_sum?(nums, target) #O(n * log n)
  nums.sort!
  until nums.empty?
    case nums.first + nums.last <=> target
    when 0
      return true
    when 1
      nums.pop
    when -1
      nums.shift
    end
  end
  false
end

def hash_two_sum?(nums, target)
  pairs = Hash.new
  nums.each do |num|
    return true if pairs[num]
    pairs[target-num] = true
  end
  false
end

def hash_four_sum?(nums, target)
  raise "too few numbers" if nums.count < 4

end

if __FILE__ == $PROGRAM_NAME
  array = (1..1_000_000).to_a.shuffle

Benchmark.bmbm do |x|
  x.report("bad: ") { bad_two_sum?(array.dup, 1024) }
  x.report("ok:  ") { ok_two_sum?(array.dup, 1024) }
  x.report("hash:") { hash_two_sum?(array.dup,1024)}
end

end
