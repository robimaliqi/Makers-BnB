feature 'visiting homepage' do
  scenario 'user visits MakersBnB homepage' do
    visit('/')
    expect(page).to have_content 'Welcome to MakersBnB'
    expect(page).to have_content 'Feel at home, anywhere'
  end
end

feature "click through to spaces page" do
  scenario "user clicks button to view spaces" do
    register_and_login
    expect(current_path).to eq ('/spaces')
  end
end