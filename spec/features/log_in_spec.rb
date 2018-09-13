# this requires a log out to be a full test

feature 'logging in' do
  scenario 'user tries to log in' do
    visit '/'
    add_first_user_and_confirm

    click_link 'Login'
    fill_in :handle, with: 'Lazy'
    fill_in :password, with: 'password1'
    click_button 'Submit'

    expect(page).to have_content('Hello, Samir')
    # expect(current_path).to be('/')
    # probably lead to membership page
  end

  scenario 'does not allow user to login with incorrect details' do
    visit '/'
    add_first_user_and_confirm

    click_link 'Login'
    fill_in :handle, with: 'Lazy'
    fill_in :password, with: 'password2'
    expect(page).to have_content('Incorrect details entered')
    expect(current_path).to be('/login')
  end
end
