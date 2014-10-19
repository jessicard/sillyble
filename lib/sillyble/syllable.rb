require 'sillyble'

module Sillyble
  class Syllable
    def self.syllable_count(word)
      word.downcase!
      return 1 if word.length <= 3
      word.sub!(/(?:[^laeiouy]es|ed|[^laeiouy]e)$/, '')
      word.sub!(/^y/, '')
      word.scan(/[aeiouy]{1,2}/).size
    end
  end
end
