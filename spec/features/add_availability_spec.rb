feature 'Add space availability' do

  scenario 'Logged in users can add more availability to their spaces' do
    visit('/')
    add_first_user_and_confirm
    add_first_space_and_confirm

    add_extra_availability_and_confirm

    expect(page).to have_content("Date successfully added to Space")
    expect(page).to have_content("2018-12-10")
  end

end
