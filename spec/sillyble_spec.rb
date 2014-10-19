require 'sillyble'

describe Sillyble::Syllable do
  it "broccoli is gross" do
    Sillyble::Syllable.syllable_count("Hello World").should eql(true)
  end
end
