feature 'update a saved bookmark' do
  scenario 'a user changes the details of a bookmark'do
    bookmark_1 = Bookmark.create(url: 'http://cnn.com',title: 'CNN')
    bookmark_2 = Bookmark.create(url: 'http://makersacademy.com',title: 'Makers Academy')
    visit('/bookmarks')

    within "#bookmark-#{bookmark_2.id}" do
      click_button 'Update'
    end

    fill_in("title", with: 'Star Tribune')
    fill_in("url", with: 'http://startribune.com')
    click_button('Submit')

    expect(page).to have_content('Star Tribune')
    expect(page).to have_content('CNN')
  end
end
