require 'web_helper'

feature 'authentication' do
  scenario 'a user can log in with a correct username and password' do
    register_and_login

    expect(current_path).to eq '/spaces'
  end

  scenario 'an error is returned if the email doesnt match' do
    register_user
    fill_in('email', with: 'anotherexample@example.com')
    fill_in('password', with: 'password123')
    click_button('Log in')

    expect(page).to have_content 'Please check your email or password'
  end

  scenario 'a user sees an error if they get their password wrong' do
    register_user
    fill_in('email', with: 'example@example.com')
    fill_in('password', with: 'wrongpassword')
    click_button('Log in')

    expect(page).to have_content 'Please check your email or password'
  end

  scenario 'a user can sign out' do
    register_user
    fill_in('email', with: 'example@example.com')
    fill_in('password', with: 'password123')
    click_button('Log in')

    click_link('Log out')

    expect(page).to have_content 'Welcome to MakersBnB'
  end
end