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

create new listing 
- adding description 
- click on "list a space" button 
- fill in description form
- click 'list my space button'
- spaces page displays space with description 