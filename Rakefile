require "bundler/gem_tasks"

desc "populate syllable dictionary file"
task :populate_dict do
  require "nokogiri"
  require "open-uri"
  require "thread"

  work_queue = Queue.new

  File.open("words.txt", "r") do |file_handle|
    file_handle.each_line do |word|
      work_queue.push word
    end
  end

  workers = (0...4).map do
    Thread.new do
      begin
        while word = work_queue.pop(true)
          page = Nokogiri::HTML(open("http://www.merriam-webster.com/dictionary/#{word}"))
          puts page.css("#headword h2").first.text.gsub(/\d/, "")
        end
      rescue
        puts "failed on #{word}"
      end
    end
  end
  workers.map(&:join)
end