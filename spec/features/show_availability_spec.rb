feature 'Show space availability' do
  scenario 'non-logged in users can see availability of spaces' do
    visit('/')
    add_first_space_and_confirm
    add_second_space_and_confirm
    click_link('View')

    # recheck out dates and availability are stored
    expect(page).to include "10/09/2018"
    expect(page).to include "11/09/2018"
  end

  scenario 'logged in users can see availability of spaces' do
    visit ('/')
    # log in process
    add_first_space_and_confirm
    add_second_space_and_confirm
    click_link('View')

    # recheck out dates and availability are stored
    expect(page).to include "10/09/2018"
    expect(page).to include "11/09/2018"
  end
end
