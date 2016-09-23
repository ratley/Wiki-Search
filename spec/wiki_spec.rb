require_relative '../wiki_search'

describe WikiSearch do
  let(:string) { "dev bootcamp" }
  let(:link) { 'https://en.wikipedia.org/wiki/' }

  it "replaces spaces in string with underscores" do
    puts "enter 'dev bootcamp' for the test\n"
    expect(WikiSearch.get_link).to eq('https://en.wikipedia.org/wiki/dev_bootcamp')
  end

  it "replaces spaces in string with underscore" do
    expect(WikiSearch.to_underscore(string)).to eq("dev_bootcamp")
  end

  it "parses page" do
    expect(WikiSearch.parse_page(link)).to be_a Nokogiri::HTML::Document
  end

end
