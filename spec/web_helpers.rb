def add_first_space_and_confirm
  click_link 'Members Area'
  click_link 'Add New Space'
  fill_in :name, with: "Samir's Super Shack"
  fill_in :info, with: '1 room, 1 bed, not great tbh'
  fill_in :location, with: 'Middle of nowhere'
  fill_in :price, with: '1000000'
  click_button 'Add New Space'
end


def add_second_space_and_confirm
  click_link 'Members Area'
  click_link 'Add New Space'
  fill_in :name, with: "Harry's Happy House"
  fill_in :info, with: '20 room, 1 bed, a work in progress'
  fill_in :location, with: 'Right here'
  fill_in :price, with: '5000'
  click_button 'Add New Space'
end

def add_first_user_and_confirm
  click_link "Signup"
  fill_in :name, with: "Samir"
  fill_in :handle, with: "Lazy"
  fill_in :email, with: "someemail@email.com"
  fill_in :password, with: "password1"
  fill_in :password_confirmation, with: "password1"
  click_button "Submit"
end

def add_extra_availability_and_confirm
  click_link 'Members Area'
  click_link "Samir's Super Shack"
  fill_in :date, with: '2018-12-10'
  click_button 'Add New Date'
end
