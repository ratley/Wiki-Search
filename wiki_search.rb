# Bradley Inniss, DBC
# Provides short summary of inputted search term(if available)

require 'rubygems'
require 'nokogiri'
require 'open-uri'

module WikiSearch

  def self.user_input

  end

end
# Refactor and pseudocode
# Parses wiki page requested by user
def search_wiki
  try_again = false
  puts "What would you like to search on Wikipedia?"
  search = gets.chomp

  new_str = []
  search.each_char do |chr|
    if chr == " "
      chr = "_"
    end
    new_str << chr
    end

  system "clear"
  begin
  page = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/" + "#{new_str.join}"))
  # p page.class
  header = page.css("h1")[0].text

  # Prints one character at a time on the same line...just to be a little fancy!
  header.each_char do |chr|
    print chr
    sleep(0.1)
    STDOUT.flush
  end

  puts "\n\n"
  puts page.css("p")[0].text

# Handles 404 error
  rescue OpenURI::HTTPError => error
    if error.message == '404 Not Found'
      puts "This page does not exist. Please try again."
      try_again = true
      search_wiki
    else
      raise error
    end
  end
  if try_again == false
    puts "\nWould you like to search something else?(y/n)"
    search_again = gets.chomp
    until search_again == "y" || search_again == "n"
      puts "Please enter 'y' or 'n'."
      search_again = gets.chomp
    end
    if search_again == "y"
      puts "\n"
      search_wiki
    end
  end
end

search_wiki