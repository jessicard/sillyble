require 'sillyble'
require 'zlib'

module Sillyble
  class Syllable
    @@syllable_map = Hash.new

    Zlib::GzipReader.open("dict.tar.gz") do |gz|
      dict = gz.read
      dict.split("\n").each do |line|
        dict_def = line.split(": ")
        @@syllable_map[dict_def[0]] = dict_def[1]
      end
    end

    def self.syllable_count(word)
      word.downcase!
      return @@syllable_map[word].scan("-").count + 1 if @@syllable_map[word]
      return 1 if word.length <= 3
      word.sub!(/(?:[^laeiouy]es|ed|[^laeiouy]e)$/, '')
      word.sub!(/^y/, '')
      word.scan(/[aeiouy]{1,2}/).size
    end
  end
end
