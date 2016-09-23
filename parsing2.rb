# Bradley Inniss, DBC
# Provides short summary of inputted search time(if available)

require 'rubygems'
require 'nokogiri'
require 'open-uri'

# Parses wiki page requested by user
  page = Nokogiri::HTML(open("http://www.phrasemix.com/collections/15-ways-to-say-hello-in-english"))

  test = page.css("blockquote").text.split
  # words = []
  # test.each do |word|
  #   if word.length >= 3 && word.length <= 5
  #     words << word
  #   end
  # end
  p test
