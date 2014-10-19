require 'sillyble'

describe Sillyble::Syllable do
  it "broccoli is gross" do
    Sillyble::Syllable.syllable_count("Hello").should eql(2)
  end
end
