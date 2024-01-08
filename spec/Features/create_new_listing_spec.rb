feature 'Create listing page' do
  before do
    visit('/')
    click_button('View Spaces')
  end

  scenario 'User can create a new listing' do
    click_button('List a Space')
    expect(page).to have_current_path('/spaces/new')
    fill_in('name', with: 'Space_1')
    click_button('List my space')
    expect(page).to have_current_path('/spaces')
    expect(page).to have_content('Space_1')
  end

  scenario 'User can create multiple listings' do
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

  scenario 'User can add description to listing' do
    click_button('List a Space')
    expect(page).to have_current_path('/spaces/new')
    fill_in('name', with: 'Space_1')
    fill_in('description', with: 'beautiful relaxing space')
    click_button('List my space')
    expect(page).to have_content('beautiful relaxing space')
  end

  scenario 'User can add a price to listing' do
    click_button('List a Space')
    expect(page).to have_current_path('/spaces/new')
    fill_in('name', with: 'Space_1')
    fill_in('description', with: 'beautiful relaxing space')
    fill_in('price', with: 100)
    click_button('List my space')
    expect(page).to have_content('100')
  end
end
