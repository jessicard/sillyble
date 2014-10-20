require "bundler/gem_tasks"

desc "populate syllable dictionary file"
task :populate_dict do
  require "nokogiri"
  require "open-uri"
  require "thread"

  page = Nokogiri::HTML(open("http://www.merriam-webster.com/dictionary/cat"))

  puts page.css("#headword h2").first.text.gsub(/\d/, "")
end