def windowed_max_range(arr, window)
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
