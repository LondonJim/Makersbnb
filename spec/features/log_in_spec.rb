feature 'Log in' do
  scenario 'User can log in' do
    visit '/'
    add_first_user_and_confirm
    click_link 'Sign Out'

    click_link 'Login'
    fill_in :handle, with: 'Lazy'
    fill_in :password, with: 'password1'
    click_button 'Submit'

    expect(page).to have_content('Welcome, Lazy')
  end

  scenario 'Does not allow user to login with incorrect details' do
    visit '/'
    add_first_user_and_confirm
    click_link 'Sign Out'

    click_link 'Login'
    fill_in :handle, with: 'Lazy2'
    fill_in :password, with: 'password2'
    click_button 'Submit'

    expect(page).to have_content('No details held')
    expect(current_path).to eq('/login')
  end
end
