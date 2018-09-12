feature "sign up" do
  scenario "can enter details on sign up page" do
    visit "/"
    click_link "Signup"
    fill_in :name, with: "Samir"
    fill_in :handle, with: "Lazy"
    fill_in :email, with: "someemail@email.com"
    fill_in :password, with: "password1"
    click_button "Submit"

    expect(page).to have_content("Welcome Samir, signup successful")
  end

  scenario "can't sign up with existing username" do
    visit "/"
    click_link "Signup"
    fill_in :name, with: "Samir"
    fill_in :handle, with: "Lazy"
    fill_in :email, with: "someemail@email.com"
    fill_in :password, with: "password1"
    click_button "Submit"

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
    click_link "Signup"
    fill_in :name, with: "Samir"
    fill_in :handle, with: "Lazy"
    fill_in :email, with: "someemail@email.com"
    fill_in :password, with: "password1"
    click_button "Submit"

    click_link "Signup"
    fill_in :name, with: "Samir"
    fill_in :handle, with: "Lazy"
    fill_in :email, with: "someotheremail@email.com"
    fill_in :password, with: "password1"
    click_button "Submit"

    expect(page).to have_content("Unable to make account, username already in use")
  end
end
