def register_user
  visit '/'
    fill_in('email', with: 'example@example.com')
    fill_in('password', with: "password123")
    click_button('Sign Up')
end