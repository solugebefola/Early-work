require "array_ex"

describe Array do
  describe '#my_uniq' do
    let(:arr) { [1,2,2,4] }
    it "returns a new array" do
      expect(arr.my_uniq).to be_a(Array)
    end
    it "removes duplicates" do
      expect(arr.my_uniq).to eq([1,2,4])
    end
    it "does not modify the original array" do
      arr.my_uniq
      expect(arr).to eq([1,2,2,4])
    end
  end

  describe '#two_sum' do
    let(:arr) { [-1, 0, 2, -2, 1] }
    it "returns a new array" do
      expect(arr.two_sum).to be_a(Array)
    end
    it "returns an empty array if no pairs match" do
      no_match = [1,2,3,4]
    end
    it "returns an array of arrays if some elements pair"
    it "returns pair indices that sum to zero"
    it "sorts index pairs by lowest first index"

  end
end
