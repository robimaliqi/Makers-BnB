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

  scenario "user can aadd description to listing" do
    visit("/")
    click_button("View Spaces")
    click_button("List a Space")
    expect(page).to have_current_path("/spaces/new")
    fill_in("name", with: "Space_1")
    fill_in("description", with: "beautiful relaxing space")
    click_button("List my space")
    expect(page).to have_content("beautiful relaxing space")
  end
end
