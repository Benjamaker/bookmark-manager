feature 'Viewing bookmarks' do
  scenario 'visisting an index page' do
    visit ('/')
    expect(page).to have_content("Welcome to Bookmark Manager")
  end
end

feature 'Viewing bookmarks' do
  scenario 'A user can see bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    connection.exec("INSERT INTO bookmarks (url) VALUES ('https://github.com/Benjamaker');")
    connection.exec("INSERT INTO bookmarks (url) VALUES ('https://www.google.com');") 
    visit('/bookmarks')
    expect(page).to have_content "https://github.com/Benjamaker"
    expect(page).to have_content "https://www.google.com"
  end
end
