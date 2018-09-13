feature 'Add space availability' do
  scenario 'logged in space-owners can add availability to their spaces' do
    visit('/')
    # log in
    add_first_space_and_confirm
    # visit member page showing own spaces
    # click own space
    # click add Availability
    # enter date / date range and confirm

    # expect(page).to have_content("Thank you Name")
    expect(page).to have_content("You have added availability for Samir's Super Shack")
  end
  # I was going to add extra tests to check users can't add to other's spaces
  # or non logged in can't add but because it's from the membership page
  # they won't get a chance.
end
