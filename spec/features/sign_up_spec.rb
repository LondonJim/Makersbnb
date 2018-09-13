feature "Sign up" do
  scenario "User can sign up with their details" do
    visit "/"

    add_first_user_and_confirm

    expect(page).to have_content("Welcome Samir, signup successful")
  end

  scenario "User can't sign up with an existing username" do
    visit "/"
    add_first_user_and_confirm

    click_link "Signup"
    fill_in :name, with: "Samir"
    fill_in :handle, with: "NotLazy"
    fill_in :email, with: "someemail@email.com"
    fill_in :password, with: "password1"
    click_button "Submit"

    expect(page).to have_content("Unable to make account, username already in use")
  end

  scenario "can't sign up with existing username" do
    visit "/"
    add_first_user_and_confirm

    click_link "Signup"
    fill_in :name, with: "Samir"
    fill_in :handle, with: "Lazy"
    fill_in :email, with: "someotheremail@email.com"
    fill_in :password, with: "password1"
    click_button "Submit"

    expect(page).to have_content("Unable to make account, username already in use")
  end
end
