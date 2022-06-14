feature "Booking a space" do
  scenario "visit spaces page" do
    visit('/spaces')
    expect(page).to have_content "Space_1"
    expect(page).to have_content "Space_2"
    expect(page).to have_content "Space_3"
  end

  scenario "click book button" do
    visit('/spaces')
    first('.spaces').click_button('Book')
    expect(page).not_to have_content "Space_1"
    expect(page).to have_content "Space_2"
    expect(page).to have_content "Space_3"
  end
end


   
