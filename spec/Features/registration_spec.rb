feature 'registration' do
  scenario 'a user can sign up' do
    visit 'users/new'
    fill_in('email', with: 'exampletest@example.com')
    fill_in('password', with: 'Password123')
    click_button('Submit')

    expect(page).to have_content "Welcome, exampletest@example.com"
  end
end