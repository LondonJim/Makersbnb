feature 'Add space availability' do

  scenario 'logged in space-owners can add new space with availability' do
    visit('/')
    add_first_space_and_confirm
    expect(page).to have_content("Space successfully added")
  end

  scenario 'logged in space-owners can add more availability to their spaces' do
    visit('/')
    add_first_space_and_confirm
    add_extra_availability_and_confirm
    expect(page).to have_content("Date successfully added to Space")
  end

  scenario 'logged in space-owners can add more availability to their spaces' do
    visit('/')
    add_first_space_and_confirm
    add_extra_availability_and_confirm
    click_link "Samir's Super Shack"
    expect(page).to have_content("2018-09-10")
    expect(page).to have_content("2018-12-10")
  end
end
