# Makers-BnB

# MVP

visit homepage
click to see spaces
list available spaces
button to book space
remove space from list

# Features
visiting homepage
visit ('/)
expect(page).to have_content "Welcome to MakersBNB"
expect(page).to have_content "Feel at home, anywhere"

click through to spaces page
visit('/')
click_button('View Spaces')
expect(current_page).to be('/spaces')