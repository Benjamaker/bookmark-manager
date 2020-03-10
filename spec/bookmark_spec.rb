require 'bookmark'
require 'pg'

describe Bookmark do

  subject(:bookmark) { described_class.new }

  context '.all' do
    it 'returns all bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      connection.exec("INSERT INTO bookmarks (url) VALUES ('https://github.com/Benjamaker');")
      connection.exec("INSERT INTO bookmarks (url) VALUES ('https://www.google.com');")
      bookmarks = Bookmark.all
      expect(bookmarks).to include('https://github.com/Benjamaker')
      expect(bookmarks).to include('https://www.google.com')

    end
  end
end
