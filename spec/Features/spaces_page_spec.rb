feature "Visit spaces page" do
  scenario "lists spaces" do
    visit('/spaces')
    expect(page).to have_content "Space_1"
    expect(page).to have_content "Space_2"
    expect(page).to have_content "Space_3"
  end
end