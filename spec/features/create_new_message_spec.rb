feature 'Make a booking' do

  scenario 'Logged in user can request dates for booking' do
    visit('/')
    add_first_user_and_confirm
    add_first_space_and_confirm
    add_extra_availability_and_confirm
    click_link ('Sign Out')
    add_second_user_and_confirm
    click_link ('Makers BnB')
    click_link ("Samir's Super Shack")
    click_button('2018-12-10')
    click_button('submit')

    expect(page).to have_content("Booking Message Sent")
  end

end
