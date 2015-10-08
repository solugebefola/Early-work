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

def fast_max_sub_sum(arr)
  current_max = arr.first
  hole = 0
  local_max = 0
  arr.drop(1).each do |el|
    local_max = 0 if local_max < 0

    hole += el if hole < 0 || el < 0
    local_max += el

    if hole > 0
      current_max += hole
      local_max = 0
      hole = 0
    else
      if local_max >= current_max
        current_max = local_max
        hole = 0
        local_max = 0
      end
    end

  end


  current_max
end
