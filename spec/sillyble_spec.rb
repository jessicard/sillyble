require 'sillyble'

describe Sillyble::Syllable do
  it "a real simple word should have a real simple syllable count" do
    Sillyble::Syllable.syllable_count("Hello").should eql(2)
  end

  it "a little more advanced word requires a more complex syllable count" do
    Sillyble::Syllable.syllable_count("balloon").should eql(2)
  end
end
