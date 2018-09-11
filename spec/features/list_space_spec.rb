Capybara.app = MakersBnB

  # As a user,
  # So I can advertise my space,
  # I want to be able to list my space.

feature 'View spaces' do
  scenario 'user can see all spaces' do
    connection = PG.connect(dbname: 'makersbnb_test')
    add_three_spaces
    visit('/spaces')
    expect(page).to have_content "spacename1"
    expect(page).to have_content "spacename2"
    expect(page).to have_content "spacename3"
  end

  # As a user,
  # So I can let people know the details of my space,
  # I want to be able to enter details of my space: name, description, price.

  scenario 'user can see details of all spaces' do
    add_three_spaces
    visit('/spaces')
    expect(page).to have_content "Price: "
    expect(page).to have_content "Location: "
    expect(page).to have_content "Owner name: "
  end
end
