Capybara.app = MakersBnB

  # As a user,
  # So I can let people know when the space is available,
  # I want to be able to list a range of dates of availability.

  scenario 'user can availability of spaces' do
    add_three_spaces
    add_availability_for_three_spaces
    visit('/spaces')
    click_link('spacename1')
    expect(page).to have_content(100918)
    expect(page).to have_content(110918)
  end
end
