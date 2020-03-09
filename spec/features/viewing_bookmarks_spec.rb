feature 'Viewing bookmarks' do
  scenario 'visisting an index page' do
    visit ('/')
    expect(page).to have_content("Welcome to Bookmark Manager")
  end
end

feature 'Viewing bookmarks' do
  scenario 'A user can see bookmarks' do
    visit('/bookmarks')
    expect(page).to have_content "https://github.com/Benjamaker"
    expect(page).to have_content "https://www.google.com"
  end
end
