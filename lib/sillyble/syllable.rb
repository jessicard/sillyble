require 'sillyble'
require 'zlib'

module Sillyble
  class Syllable
    @@syllable_map = Hash.new

    Zlib::GzipReader.open(File.expand_path("../dict.tar.gz", __FILE__)) do |gz|
      dict = gz.read
      dict.split("\n").each do |line|
        dict_def = line.split(":")
        @@syllable_map[dict_def[0]] = dict_def[1]
      end
    end

    def self.count(word)
      word.downcase!
      return @@syllable_map[word].scan("-").count + 1 if @@syllable_map[word]
      return 1 if word.length <= 3
      word.sub!(/(?:[^laeiouy]es|ed|[^laeiouy]e)$/, '')
      word.sub!(/^y/, '')
      word.scan(/[aeiouy]{1,2}/).size
    end
  end
end
