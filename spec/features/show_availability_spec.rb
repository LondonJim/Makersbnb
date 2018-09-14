feature 'Show space availability' do
  scenario 'non-logged in users can not see availability of spaces' do
    visit('/')
    add_first_user_and_confirm
    add_first_space_and_confirm
    add_extra_availability_and_confirm
    click_link "Sign Out"

    click_link "Samir's Super Shack"

    expect(page).to have_content "Sign in to view dates"
  end

  scenario 'logged in users can see availability of spaces' do
    visit ('/')
    add_first_user_and_confirm
    add_first_space_and_confirm
    add_extra_availability_and_confirm
    click_link 'Members Area'

    click_link "Samir's Super Shack"

    expect(page).to have_content "2018-12-10"
  end
end
