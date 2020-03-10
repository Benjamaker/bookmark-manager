feature 'Viewing bookmarks' do
  scenario 'visisting an index page' do
    visit ('/')
    expect(page).to have_content("Welcome to Bookmark Manager")
  end
end

feature 'Viewing bookmarks' do
  scenario 'A user can see bookmarks' do
    Bookmark.add(title: 'github', url: 'https://github.com/Benjamaker')
    Bookmark.add(title: 'google', url: 'https://www.google.com')
    visit('/bookmarks')
    expect(page).to have_link('github', href:"https://github.com/Benjamaker")
    expect(page).to have_link('google', href:"https://www.google.com")
  end
end
