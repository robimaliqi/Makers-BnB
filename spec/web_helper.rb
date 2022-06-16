def register_user
  visit '/'
    fill_in('email', with: 'example@example.com')
    fill_in('password', with: "password123")
    click_button('Sign Up')
end

def register_and_login
  visit '/'
    fill_in('email', with: 'example@example.com')
    fill_in('password', with: "password123")
    click_button('Sign Up')
    fill_in('email', with: 'example@example.com')
    fill_in('password', with: "password123")
    click_button('Log in')
end