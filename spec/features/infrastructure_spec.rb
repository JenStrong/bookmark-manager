
feature 'View index page set-up' do
  scenario 'A user can access the server' do
    visit('/')

    expect(page).to have_content 'page working!'
  end
end
