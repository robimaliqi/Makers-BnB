feature "Create listing page" do
  xscenario "User can create a new listing" do
    visit("/")
    click_button("View Spaces")
    click_button("List a Space")
    expect(page).to have_current_path("/spaces/new")
    fill_in("name", with: "Space_1")
    click_button("List my space")
    expect(page).to have_current_path("/spaces")
    expect(page).to have_content("Space_1")
  end

  xscenario "User can create multiple listings" do
    visit("/")
    click_button("View Spaces")
    click_button("List a Space")
    expect(page).to have_current_path("/spaces/new")
    fill_in("name", with: "Space_1")
    click_button("List my space")
    click_button("List a Space")
    expect(page).to have_current_path("/spaces/new")
    fill_in("name", with: "Space_2")
    click_button("List my space")
    expect(page).to have_current_path("/spaces")
    expect(page).to have_content("Space_1")
    expect(page).to have_content("Space_2")
  end

  xscenario "user can add description to listing" do
    visit("/")
    click_button("View Spaces")
    click_button("List a Space")
    expect(page).to have_current_path("/spaces/new")
    fill_in("name", with: "Space_1")
    fill_in("description", with: "beautiful relaxing space")
    click_button("List my space")
    expect(page).to have_content("beautiful relaxing space")
  end

  xscenario "user can add a price to listing" do
    visit("/")
    click_button("View Spaces")
    click_button("List a Space")
    expect(page).to have_current_path("/spaces/new")
    fill_in("name", with: "Space_1")
    fill_in("description", with: "beautiful relaxing space")
    fill_in("price", with: 100)
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
    fill_in("available_from", with: "01/01/2022")
    fill_in("available_to", with: "07/01/2022")
    click_button("List my space")
    expect(page).to have_content("01/01/2022")
    expect(page).to have_content("07/01/2022")
  end
end
