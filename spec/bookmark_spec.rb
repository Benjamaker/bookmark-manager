require 'bookmark'

describe Bookmark do

  subject(:bookmark) { described_class.new }

  context '.all' do
    it 'returns all bookmarks' do
      bookmarks = Bookmark.all

      expect(bookmarks).to include("https://github.com/Benjamaker")
      expect(bookmarks).to include("https://www.google.com")

    end
  end
end
