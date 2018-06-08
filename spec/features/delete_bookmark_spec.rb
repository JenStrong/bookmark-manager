feature 'Deleting bookmarks' do
  scenario 'a user deletes a saved bookmark' do
    bookmark_1 = Bookmark.create(url: 'http://cnn.com', title: 'CNN')
    bookmark_2 = Bookmark.create(url: 'http://makersacademy.com', title: 'Makers Academy')

    visit('/bookmarks')

    within "#bookmark-#{bookmark_2.id}" do
      click_button 'Delete'
    end

    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_content 'Makers Academy'
    expect(page).to have_content 'CNN'
  end
end
