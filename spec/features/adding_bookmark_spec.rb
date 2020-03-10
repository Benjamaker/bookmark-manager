feature 'Adding Bookmarks' do
  scenario 'Adding Bookmark Title and URL' do
    visit ('/bookmarks/new')
    fill_in('url', :with => 'https://www.Github.com')
    fill_in('title', :with => 'github')
    click_button('Submit')
    expect(page).to have_link('github', href: 'https://www.Github.com')
  end
end
