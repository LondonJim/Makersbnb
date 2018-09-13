feature 'Show spaces' do
  scenario 'Users can see all spaces' do
    visit('/')
    add_first_space_and_confirm
    add_second_space_and_confirm

    expect(page).to have_content "Samir's Super Shack"
    expect(page).to have_content "Harry's Happy House"
  end

  scenario 'Users can see details of all spaces' do
    visit('/')
    add_first_space_and_confirm
    add_second_space_and_confirm

    expect(page).to have_content "Price: 1000000"
    expect(page).to have_content "Info: 1 room, 1 bed, not great tbh"
    expect(page).to have_content "Middle of nowhere"
  end
end
