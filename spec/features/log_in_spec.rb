feature 'logging in' do
  scenario 'user tries to log in' do
    visit '/'
    click_link 'Login'
    fill_in :handle, with: 'a'
    fill_in :password, with: 'a'
    expect(page).to have_content('Welcome a')
    expect(current_path).to be('/')
  end

  scenario 'does not allow user to login with incorrect details' do
    visit '/'
    click_link 'Login'
    fill_in :handle, with: 'a'
    fill_in :password, with: 'b'
    expect(page).to have_content('Incorrect details entered')
    expect(current_path).to be('/login')
  end
end
