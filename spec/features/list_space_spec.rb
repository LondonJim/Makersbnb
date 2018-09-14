feature 'List spaces' do
  scenario 'Logged in users can see all spaces' do
    visit('/')
    add_first_user_and_confirm
    add_first_space_and_confirm
    add_second_space_and_confirm
    click_link "Makers BnB"

    expect(page).to have_content "Samir's Super Shack"
    expect(page).to have_content "Price: 1000000"
    expect(page).to have_content "Info: 1 room, 1 bed, not great tbh"
    expect(page).to have_content "Middle of nowhere"

    expect(page).to have_content "Harry's Happy House"
    expect(page).to have_content "Price: 5000"
    expect(page).to have_content "Info: 20 room, 1 bed, a work in progress"
    expect(page).to have_content "Right here"
  end

  scenario 'Non-logged in users can see all spaces' do
    visit('/')
    add_first_user_and_confirm
    add_first_space_and_confirm
    add_second_space_and_confirm
    click_link "Sign Out"

    expect(page).to have_content "Samir's Super Shack"
    expect(page).to have_content "Price: 1000000"
    expect(page).to have_content "Info: 1 room, 1 bed, not great tbh"
    expect(page).to have_content "Middle of nowhere"

    expect(page).to have_content "Harry's Happy House"
    expect(page).to have_content "Price: 5000"
    expect(page).to have_content "Info: 20 room, 1 bed, a work in progress"
    expect(page).to have_content "Right here"
  end
end
