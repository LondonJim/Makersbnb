Capybara.app = MakersBnB

feature 'Create spaces' do
  scenario 'Owner can add a space' do
    visit('/')
    click_link 'Add'
    fill_in :user_id, with: '1'
    fill_in :name, with: 'samir lodge'
    fill_in :info, with: '3 bed'
    fill_in :location, with: 'aldgate east'
    fill_in :price, with: '500'
    fill_in :date, with: '2018-09-14'
    click_button 'Add space'
    expect(page).to have_content("Space successfully added")
  end

end
