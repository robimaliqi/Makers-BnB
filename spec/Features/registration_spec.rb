feature 'registration' do
  scenario 'a user can sign up' do
    visit '/'
    fill_in('email', with: 'example@example.com')
    fill_in('password', with: "password123")
    click_button('Sign Up')

    expect(page).to have_content "Log in to MakersBnB"
  end
end