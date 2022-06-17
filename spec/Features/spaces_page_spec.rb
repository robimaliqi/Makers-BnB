feature "Booking a space" do
  scenario "visit spaces page" do
    space_1 = Spaces.create(name: "Space_1", description: "beautiful, relaxing space", price: "100", available_from: "2022-07-01", available_to: "2022-07-07")
    space_2 = Spaces.create(name: "Space_2", description: "beautiful, relaxing space", price: "100", available_from: "2022-07-01", available_to: "2022-07-07")
    space_3 = Spaces.create(name: "Space_3", description: "beautiful, relaxing space", price: "100", available_from: "2022-07-01", available_to: "2022-07-07")
    visit('/spaces')
    expect(page).to have_content "Space_1"
    expect(page).to have_content "Space_2"
    expect(page).to have_content "Space_3"
  end

  scenario "click book button" do
    space_1 = Spaces.create(name: "Space_1", description: "beautiful, relaxing space", price: "100", available_from: "2022-07-01", available_to: "2022-07-07")
    space_2 = Spaces.create(name: "Space_2", description: "beautiful, relaxing space", price: "100", available_from: "2022-07-01", available_to: "2022-07-07")
    space_3 = Spaces.create(name: "Space_3", description: "beautiful, relaxing space", price: "100", available_from: "2022-07-01", available_to: "2022-07-07")
    visit('/spaces')
    first('.spaces').click_button('Book')
    expect(page).not_to have_content "Space_1"
    expect(page).to have_content "Space_2"
    expect(page).to have_content "Space_3"
  end
end


   
