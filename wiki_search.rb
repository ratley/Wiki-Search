# Bradley Inniss, DBC 9/1/2016
# Provides short description of inputted search term(if available)

require 'nokogiri'
require 'open-uri'

module WikiSearch

  @@wiki = "https://en.wikipedia.org/wiki/"

  def self.to_underscore(string)
    string.gsub(/ /, '_')
  end

  # Creates the link using user input
  # (ex: https://en.wikipedia.org/wiki/dev_bootcamp)
  def self.get_link
    puts "What would you like to search on Wikipedia?"
    link = @@wiki + to_underscore(gets.chomp)
    link
  end

  # Parses Wiki page using Nokogiri
  def self.parse_page(link)
    page = Nokogiri::HTML(open(link))
    @@header = page.css('h1')[0].text
    @@description = page.css("p")[0].text
    page
  end


  # Combines the parsing, searching, and displaying methods into one
  def self.search
    begin
      parse_page(get_link)
      system "clear"
      display
      search_again

    rescue OpenURI::HTTPError => error
        if error.message == '404 Not Found'
          puts "This page does not exist. Please try again."
          search
        else
          raise error
        end
    end
  end

  # Displays page header and a the first 'p' on the page
  def self.display
    @@header.each_char do |chr|
        print chr
        sleep(0.1)
        STDOUT.flush
      end
      puts "\n\n"
      puts @@description
  end

  # Used to search again after a search has been made
  def self.search_again
      puts "\nWould you like to search something else?(y/n)"
      search_again = gets.chomp
      until search_again == "y" || search_again == "n"
        puts "Please enter 'y' or 'n'."
        search_again = gets.chomp
      end
      if search_again == "y"
        puts "\n"
        clear_screen & search
      else
        exit
      end
  end

  # Clears screen
  def self.clear_screen
    system "clear"
  end
  
end
