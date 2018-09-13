feature "Sign up" do
  scenario "User can sign up with their details" do
    visit "/"

    add_first_user_and_confirm

    expect(page).to have_content("Signup successful, you are now logged in as Samir")
  end

  scenario "User can't sign up with an existing username" do
    visit "/"
    add_first_user_and_confirm
    click_link "Sign Out"

    click_link "Signup"
    fill_in :name, with: "Samir"
    fill_in :handle, with: "NotLazy"
    fill_in :email, with: "someemail@email.com"
    fill_in :password, with: "password1"
    fill_in :password_confirmation, with: "password1"
    click_button "Submit"

    expect(page).to have_content("Email has already been taken")
  end

  scenario "can't sign up with existing username" do
    visit "/"
    add_first_user_and_confirm
    click_link "Sign Out"

    click_link "Signup"
    fill_in :name, with: "Samir"
    fill_in :handle, with: "Lazy"
    fill_in :email, with: "someotheremail@email.com"
    fill_in :password, with: "password1"
    fill_in :password_confirmation, with: "password1"
    click_button "Submit"

    expect(page).to have_content("Username has already been taken")
  end
end
