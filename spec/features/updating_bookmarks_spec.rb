feature 'updating bookmarks' do
  scenario 'user can update bookmark manager' do
    bookmark = Bookmark.add(title: 'makers', url: 'https://makers.tech')
    visit ('/bookmarks')
    expect(page).to have_link('makers', href: 'https://makers.tech')

    first('.bookmark').click_button 'Edit'
    expect(current_path).to eq("/bookmarks/#{bookmark.id}/edit")

    fill_in('url', with: "https://snakers.tech")
    fill_in('title', with: "Snakers Academy")

    click_button('Submit')

    expect(current_path).to eq ('/bookmarks')
    expect(page).not_to have_link('makers', href: 'https://makers.tech')
    expect(page).to have_link('Snakers Academy', href: 'https://snakers.tech')

  end
end
