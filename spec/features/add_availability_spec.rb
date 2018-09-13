feature 'Add space availability' do

  # add spec tests for logged in users and delete current
  scenario 'Logged in users can add new space with availability' do
    visit('/')
    add_first_user_and_confirm
    add_first_space_and_confirm


    expect(page).to have_content("Space successfully added")
  end

  scenario 'Logged in users can add more availability to their spaces' do
    visit('/')

    add_first_space_and_confirm
    add_extra_availability_and_confirm

    expect(page).to have_content("Date successfully added to Space")
  end

end
