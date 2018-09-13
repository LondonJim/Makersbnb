
def add_first_space_and_confirm
  click_link 'Add'
  fill_in :user_id, with: '1'
  fill_in :name, with: "Samir's Super Shack"
  fill_in :info, with: '1 room, 1 bed, not great tbh'
  fill_in :location, with: 'Middle of nowhere'
  fill_in :price, with: '1000000'
  fill_in :date, with: '2018-09-10'
  # date to be changed in line with calendar changes
  click_button 'Add space'
  expect(page).to have_content("Space successfully added")
end

def add_second_space_and_confirm
  click_link 'Add'
  fill_in :user_id, with: '2'
  fill_in :name, with: "Harry's Happy House"
  fill_in :info, with: '20 room, 1 bed, a work in progress'
  fill_in :location, with: 'Right here'
  fill_in :price, with: '5000'
  fill_in :date, with: '2018-09-11'
  # date to be changed in line with calendar changes
  click_button 'Add space'
  expect(page).to have_content("Space successfully added")
end

def add_first_user_and_confirm
  click_link "Signup"
  fill_in :name, with: "Samir"
  fill_in :handle, with: "Lazy"
  fill_in :email, with: "someemail@email.com"
  fill_in :password, with: "password1"
  click_button "Submit"
end
