require 'sillyble'

module Sillyble
  class Syllable
    def self.syllable_count(word)
      word.scan(/[aeiou]/).count
    end
  end
end
