feature 'Sign out' do
  scenario 'User can sign out' do
    visit '/'
    add_first_user_and_confirm
    click_link 'Sign Out'
    expect(page).to have_content('You have signed out, see you again soon!')
  end
end
