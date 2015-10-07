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
      expect(no_match.two_sum).to eq([])
    end

    it "returns an array of arrays if some elements pair" do
      expect(arr.two_sum[0]).to be_a(Array)
    end

    it "returns pair indices that sum to zero" do
      expect(arr.two_sum).to eq([[0, 4], [2, 3]])
    end

    it "does not modify the original array" do
      arr.two_sum
      expect(arr).to eq([-1, 0, 2, -2, 1])
    end
  end

  describe '#my_transpose' do
    it "returns an empty array when operating on an empty array" do
      expect([].my_transpose).to eq([])
    end
    it "works on a square array" do
      arr = [[1,2],
             [3,4]]
      expect(arr.my_transpose).to eq([[1,3],
                                      [2,4]])
    end
    it "works on a rectangular array"
    it "does not modify the original"
  end


end
