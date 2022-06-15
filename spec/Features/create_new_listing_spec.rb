feature "Create listing page" do
  scenario "User can create a new listing" do
    visit('/')
    click_button('View Spaces')
    click_button('List a Space')
    expect(page).to have_current_path('/spaces/new')
    fill_in('name', with: 'Space_1')
    click_button('List my space')
    expect(page).to have_current_path('/spaces')
    expect(page).to have_content('Space_1')
  end

  scenario "User can create multiple listings" do
    visit('/')
    click_button('View Spaces')
    click_button('List a Space')
    expect(page).to have_current_path('/spaces/new')
    fill_in('name', with: 'Space_1')
    click_button('List my space')
    click_button('List a Space')
    expect(page).to have_current_path('/spaces/new')
    fill_in('name', with: 'Space_2')
    click_button('List my space')
    expect(page).to have_current_path('/spaces')
    expect(page).to have_content('Space_1')
    expect(page).to have_content('Space_2')
  end
end
