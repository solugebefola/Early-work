require 'time-difference'

describe '#fast_max_sum_sub' do
  it "works with a negative first number" do
    expect(fast_max_sub_sum([-7, -2, 10,-10, 5])).to eq(10)
  end

  it "works with a single element array" do
    expect(fast_max_sub_sum([5])).to eq(5)
  end

  it "finds an internal largest sum" do
    expect(fast_max_sub_sum([-7, -2, 10, 10, -5])).to eq(20)
    expect(fast_max_sub_sum([-7, 2, -1, 10, -8, 10])).to eq(13)
  end
end
