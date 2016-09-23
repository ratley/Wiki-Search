require_relative '../wiki_search'

describe WikiSearch do
  let(:string) { "dev bootcamp" }
  let(:link) { 'https://en.wikipedia.org/wiki/' }

  it "replaces spaces in string with underscores" do
    expect(WikiSearch.to_underscore(string)).to eq('dev_bootcamp')
  end

  it "adds string to wikipedia link" do
    expect(WikiSearch.link(string)).to eq("https://en.wikipedia.org/wiki/dev_bootcamp")
  end

  it "parses page" do
    expect(WikiSearch.parse_page).to be_a Nokogiri::HTML::Document
  end

end
