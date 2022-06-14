feature "visiting homepage" do
  scenario "user visits MakersBnB homepage" do
    visit('/')
    expect(page).to have_content "Welcome to MakersBNB"
    expect(page).to have_content "Feel at home, anywhere"
  end
end