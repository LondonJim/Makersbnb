Capybara.app = MakersBnB

feature 'Adding dates to Spaces' do
  scenario 'date is displayed from added space' do
    visit('/')
    click_link 'Add'
    page.find('span', :text => 'form1').find(:xpath, '..').fill_in('user_id'), :with => '1')
    page.find('span', :text => 'form1').find(:xpath, '..').fill_in('name'), :with => 'samir lodge')
    fill_in :info, with: '3 bed'
    fill_in :location, with: 'aldgate east'
    fill_in :price, with: '500'
    page.find('span', :text => 'form1').find(:xpath, '..').fill_in('date'), :with => '2018-09-14')
    click_button 'Add space'
    click_link 'View'
    click_link 'samir lodge'
    expect(page).to have_content('2018-09-14')
  end

  scenario 'date can be added to existing space' do
    visit('/')
    click_link 'Add'
    page.find('span', :text => 'form1').find(:xpath, '..').fill_in('user_id'), :with => '1')
    page.find('span', :text => 'form1').find(:xpath, '..').fill_in('name'), :with => 'samir lodge')
    fill_in :info, with: '3 bed'
    fill_in :location, with: 'aldgate east'
    fill_in :price, with: '500'
    page.find('span', :text => 'form1').find(:xpath, '..').fill_in('date'), :with => '2018-09-14')
    click_button 'Add space'
    click_link 'Add'
    page.find('span', :text => 'form2').find(:xpath, '..').fill_in('user_id'), :with => '1')
    page.find('span', :text => 'form2').find(:xpath, '..').fill_in('name'), :with => 'samir lodge')
    page.find('span', :text => 'form2').find(:xpath, '..').fill_in('date'), :with => '2018-09-16')
    click_button 'Add New Date'
    click_link 'View'
    click_link 'samir lodge'
    expect(page).to have_content('2018-09-14')
    expect(page).to have_content('2018-09-16')
end

end
