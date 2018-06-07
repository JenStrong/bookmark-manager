feature 'Deleting bookmarks' do
  scenario 'a user deletes a saved bookmark' do
    Bookmark.create(url: 'http://makersacademy.com', title: 'Makers Academy')

    visit('/bookmarks')

    within 'ul' do
      click_button 'Delete'
    end

    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_content 'Makers Academy'
  end
end
