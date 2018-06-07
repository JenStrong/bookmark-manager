require 'pg'

feature 'Viewing bookmarks' do
  scenario 'A user can see bookmark titles' do

    Bookmark.create(url: "http://makersacademy.com", title: "Makers Academy")
    Bookmark.create(url: "http://destroyallsoftware.com", title: "Destroy All Software")
    Bookmark.create(url: "http://google.com", title: "Google")

    visit('/bookmarks')

    expect(page).to have_content "Makers Academy"
    expect(page).to have_content "Destroy All Software"
    expect(page).to have_content "Google"
  end
end
