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
    it 'deletes bookmarks' do
      bookmark = Bookmark.add(title: 'codewars', url: 'https://www.codewars.com/dashboard')
      Bookmark.delete(id: bookmark.id)
      expect(Bookmark.all.length).to eq 0
    end
  end

  context '.update' do
    it 'updates bookmarks' do
      bookmark = Bookmark.add(title: 'makers', url: 'https://makers.tech')
      updated_bookmark = Bookmark.update(id: bookmark.id, title: 'Snakers Academy', url: 'https://snakers.tech')
      expect(updated_bookmark).to be_a Bookmark
      expect(updated_bookmark.id).to eq bookmark.id
      expect(updated_bookmark.title).to eq('Snakers Academy')
      expect(updated_bookmark.url).to eq('https://snakers.tech')
    end
  end

  context '.find' do
    it 'returns the requested bookmark object' do
      bookmark = Bookmark.add(title: 'makers', url: 'https://makers.tech')
      result = Bookmark.find(id: bookmark.id)
      expect(result).to be_a Bookmark
      expect(result.id).to eq bookmark.id
      expect(result.title).to eq('makers')
      expect(result.url).to eq('https://makers.tech')
    end
  end
end
