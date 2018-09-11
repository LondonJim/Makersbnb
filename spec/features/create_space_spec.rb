Capybara.app = MakersBnB

feature 'Create spaces' do
  scenario 'Owner can add a space' do
    visit('/')
    click_button 'Add a space'
    fill_in :owner_id, with: '1'
    fill_in :name, with: 'samir lodge'
    fill_in :information, with: '3 bed'
    fill_in :location, with: 'aldgate east'
    fill_in :price, with: '500'
    expect(page).to have_content('samir lodge')
  end

end
