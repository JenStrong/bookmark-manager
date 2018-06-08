feature 'update a saved bookmark' do
  scenario 'a user changes the details of a bookmark'do
    Bookmark.create(url: 'http://makersacademy.com',title: 'Makers Academy')
    visit('/bookmarks')

    within 'ul' do
      click_button 'Update'
    end

    fill_in("title", with: 'Star Tribune')
    fill_in("url", with: 'http://startribune.com')
    click_button('Submit')

    expect(page).to have_content('Star Tribune')
  end
end
