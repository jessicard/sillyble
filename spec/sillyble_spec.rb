require 'sillyble'

def load_fixture(fixture_name)
  File.open(File.expand_path("../fixtures/#{fixture_name}", __FILE__)) do |f|
    yield f
  end
end

describe Sillyble::Syllable do
  it "a real simple word should have a real simple syllable count" do
    Sillyble::Syllable.count("hello").should eql(2)
  end

  it "a little more advanced word requires a more complex syllable count" do
    Sillyble::Syllable.count("balloon").should eql(2)
  end

  1.upto(2).each do |i|
    load_fixture("#{i}-syllable.txt") do |f|
      f.each_line do |word|
        word.chomp!
        it "#{word} should be marked as having #{i} syllable(s)" do
          Sillyble::Syllable.count(word).should eql(i)
        end
      end
    end
  end

end
