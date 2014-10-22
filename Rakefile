require "bundler/gem_tasks"

desc "populate syllable dictionary file"
task :populate_dict do
  require "nokogiri"
  require "open-uri"
  require "thread"

  work_queue = Queue.new

  File.open("words.txt", "r") do |file_handle|
    file_handle.each_line do |word|
      work_queue.push word.chomp
    end
  end

  File.open("dict.txt", "w") do |file_handle|
    workers = (0...4).map do
      Thread.new do
        while word = work_queue.pop(true)
          begin
            page = Nokogiri::HTML(open("http://www.howmanysyllables.com/words/#{word}"))
            syllables = page.css("#SyllableContainer_ResultFormatting")[1].text.gsub("\w", "")
            string = "#{word}: #{syllables}"
            file_handle.puts string
          rescue
          end
        end
      end
    end
    workers.map(&:join)
  end
end
