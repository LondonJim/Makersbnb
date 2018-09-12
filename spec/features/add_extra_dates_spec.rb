Capybara.app = MakersBnB

feature 'Adding dates to Spaces' do
  scenario 'date is displayed from added space' do
    visit('/')
    click_link 'Add'
    fill_in :user_id, with: '1'
    fill_in :name, with: 'samir lodge'
    fill_in :info, with: '3 bed'
    fill_in :location, with: 'aldgate east'
    fill_in :price, with: '500'
    fill_in :date, with: '2018-09-14'
    click_button 'Add New Space'
    click_link 'View'
    click_link 'samir lodge'
    expect(page).to have_content('2018-09-14')
  end

  scenario 'date can be added to existing space' do
    visit('/')
    click_link 'Add'
    fill_in :user_id, with: '1'
    fill_in :name, with: 'samir lodge'
    fill_in :info, with: '3 bed'
    fill_in :location, with: 'aldgate east'
    fill_in :price, with: '500'
    fill_in :date, with: '2018-09-14'
    click_button 'Add New Space'
    click_link 'Add'
    fill_in :user_id_2, with: '1'
    fill_in :name_2, with: 'samir lodge'
    fill_in :date_2, with: '2018-09-16'
    click_button 'Add New Date'
    click_link 'View'
    click_link 'samir lodge'
    expect(page).to have_content('2018-09-14')
    expect(page).to have_content('2018-09-16')
end

end
