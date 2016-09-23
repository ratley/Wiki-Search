require_relative 'wiki_search'

describe WikiSearch do
let(:string) { "dev bootcamp"}
  it 'replaces spaces in string with underscores' do
    expect(WikiSearch.to_underscore(string)).to eq('dev_bootcamp')
  end









end
