require 'sillyble'

def load_fixture(fixture_name)
  File.open(File.expand_path("../fixtures/#{fixture_name}", __FILE__)) do |f|
    yield f
  end
end

describe Sillyble::Syllable do
  it "a real simple word should have a real simple syllable count" do
    Sillyble::Syllable.count("Hello").should eql(2)
  end

  it "a little more advanced word requires a more complex syllable count" do
    Sillyble::Syllable.count("balloon").should eql(2)
  end

  load_fixture("one-syllable.txt") do |f|
    f.each_line do |word|
      word.chomp!
      it "#{word} should be marked as having one syllable" do
        Sillyble::Syllable.count(word).should eql(1)
      end
    end
  end
end
