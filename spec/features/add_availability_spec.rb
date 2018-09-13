feature 'Add space availability' do

  # add spec tests for logged in users and delete current
  scenario 'space-owners can add new space with availability' do
    visit('/')

    add_first_space_and_confirm

    expect(page).to have_content("Space successfully added")
  end

  scenario 'space-owners can add more availability to their spaces' do
    visit('/')

    add_first_space_and_confirm
    add_extra_availability_and_confirm

    expect(page).to have_content("Date successfully added to Space")
  end

end
