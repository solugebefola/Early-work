def my_min(arr) #Big-O(n^2)
  arr.each do |el1|
    smallest = true
    arr.each do |el2|
      smallest = false if el2 < el1
    end
    return el1 if smallest
  end
end

def my_min_2(arr) #Big-O(n)
  min = nil
  arr.each do |el|
    min = el if min.nil?
    min = el if el < min
  end
  min
end

def max_sub_sum(arr)  #Big-O(n^2)
  sub_arrs = []
  arr.each.with_index do |_, idx|
    arr.each.with_index do |_, idy|
      sub_arrs << arr[idx..idy] if idx <= idy
    end
  end
  sub_arrs.compact!
  sub_arrs.map! do |sub_arr|
    sub_arr.inject(&:+)
  end
  sub_arrs.max
end
