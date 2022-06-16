require 'web_helper'

feature 'logging in' do
  scenario 'a user can log in' do
    register_user
    fill_in('email', with: 'example@example.com')
    fill_in('password', with: "password123")
    click_button('Log in')

    expect(current_path).to eq "/spaces"
  end
end