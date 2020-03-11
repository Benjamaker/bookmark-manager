require 'bookmark'

describe Bookmark do

  context '.all' do
    it 'returns all bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      Bookmark.add(title: 'github', url: 'https://github.com/Benjamaker')
      Bookmark.add(title: 'google', url: 'https://www.google.com')
      bookmarks = Bookmark.all
      expect(bookmarks.first.url).to eq('https://github.com/Benjamaker')
      expect(bookmarks.first.title).to eq('github')
      expect(bookmarks.last.url).to eq('https://www.google.com')
      expect(bookmarks.last.title).to eq('google')

    end
  end

  context '.add' do
    it 'adds bookmarks' do
      bookmark = Bookmark.add(title: 'codewars', url: 'https://www.codewars.com/dashboard')
      expect(bookmark.url).to eq('https://www.codewars.com/dashboard')
      expect(bookmark.title).to eq('codewars')
    end
  end

  context '.delete' do
    it 'deletes Bookmarks' do
      bookmark = Bookmark.add(title: 'codewars', url: 'https://www.codewars.com/dashboard')
      Bookmark.delete(id: bookmark.id)
      expect(Bookmark.all.length).to eq 0
    end
  end
end
