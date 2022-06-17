feature "Create listing page" do
  scenario "User can create a new listing" do
    visit("/")
    click_button("View Spaces")
    click_button("List a Space")
    expect(page).to have_current_path("/spaces/new")
    fill_in("name", with: "Space_1")
    fill_in("price", with: 100)
    fill_in("available_from", with: "2022-01-01")
    fill_in("available_to", with: "2022-01-07")
    click_button("List my space")
    expect(page).to have_current_path("/spaces")
    expect(page).to have_content("Space_1")
  end

  scenario "User can create multiple listings" do
    visit("/")
    click_button("View Spaces")
    click_button("List a Space")
    expect(page).to have_current_path("/spaces/new")
    fill_in("name", with: "Space_1")
    fill_in("price", with: 100)
    fill_in("available_from", with: "2022-01-01")
    fill_in("available_to", with: "2022-01-07")
    click_button("List my space")
    click_button("List a Space")
    expect(page).to have_current_path("/spaces/new")
    fill_in("name", with: "Space_2")
    fill_in("price", with: 100)
    fill_in("available_from", with: "2022-01-01")
    fill_in("available_to", with: "2022-01-07")
    click_button("List my space")
    expect(page).to have_current_path("/spaces")
    expect(page).to have_content("Space_1")
    expect(page).to have_content("Space_2")
  end

 scenario "user can add description to listing" do
    visit("/")
    click_button("View Spaces")
    click_button("List a Space")
    expect(page).to have_current_path("/spaces/new")
    fill_in("name", with: "Space_1")
    fill_in("description", with: "beautiful relaxing space")
    fill_in("price", with: 100)
    fill_in("available_from", with: "2022-01-01")
    fill_in("available_to", with: "2022-01-07")
    click_button("List my space")
    expect(page).to have_content("beautiful relaxing space")
  end

  scenario "user can add a price to listing" do
    visit("/")
    click_button("View Spaces")
    click_button("List a Space")
    expect(page).to have_current_path("/spaces/new")
    fill_in("name", with: "Space_1")
    fill_in("description", with: "beautiful relaxing space")
    fill_in("price", with: 100)
    fill_in("available_from", with: "2022-01-01")
    fill_in("available_to", with: "2022-01-07")
    click_button("List my space")
    expect(page).to have_content("100")
  end
 scenario "user can add a range of dates" do
    visit("/")
    click_button("View Spaces")
    click_button("List a Space")
    expect(page).to have_current_path("/spaces/new")
    fill_in("name", with: "Space_1")
    fill_in("description", with: "beautiful relaxing space")
    fill_in("price", with: 100)
    fill_in("available_from", with: "2022-01-01")
    fill_in("available_to", with: "2022-01-07")
    click_button("List my space")
    expect(page).to have_content("01/01/2022")
    expect(page).to have_content("07/01/2022")
  end
end
