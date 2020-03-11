feature 'deleting bookmarks' do
  scenario 'I can delete existing bookmarks' do
    Bookmark.add(title: 'slack', url: 'https://slack.com')
    visit '/bookmarks'
    expect(page).to have_link('slack', href: 'https://slack.com')
    first('.bookmark').click_button('Delete')
    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link('slack', href: 'https://slack.com')
  end
end
