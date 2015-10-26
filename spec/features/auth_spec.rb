require 'spec_helper'
require 'rails_helper'

feature "the signup process" do
  before :each do
    visit new_user_url
  end
  scenario "it has a new user page" do
    expect(page).to have_content "Sign Up"
  end

  scenario "it takes a username and password" do
    expect(page).to have_content "Username"
    expect(page).to have_content "Password"
  end

    feature "signing up a user" do
      scenario "shows username on the homepage after signup" do
        fill_in "Username", with: "bobert"
        fill_in "Password", with: "password"
        click_button "Sign Up"
        expect(page).to have_content "bobert"
      end

      scenario "validates the presence of the user's username" do
        click_button "Sign Up"
        expect(page).to have_content "Sign Up"
        expect(page).to have_content "Username can't be blank"
      end

      scenario "rejects a zero-length password" do
        fill_in "Username", with: "bobert"
        click_button "Sign Up"
        expect(page).to have_content "Password is too short"
      end

      scenario "validates password is at least six characters" do
        fill_in "Username", with: "bobert"
        fill_in "Password", with: "short"
        click_button "Sign Up"
        expect(page).to have_content "Password is too short"
      end


    end

end

feature "the sign in process" do
  before :each do
    visit new_session_url
    User.create!(username: "bobert", password: "password")
  end

  scenario "has a sign in page" do
  end

  scenario "it takes a username and password" do
    expect(page).to have_content "Username"
    expect(page).to have_content "Password"
  end

  feature "signing in a user" do
    scenario "shows username on the homepage after signup" do
      fill_in "Username", with: "bobert"
      fill_in "Password", with: "password"
      click_button "Sign In"
      expect(page).to have_content "bobert"
    end

    scenario "validates the presence of the user's username" do
      click_button "Sign In"
      expect(page).to have_content "Sign In"
      expect(page).to have_content "Invalid username and/or password"
    end

    scenario "rejects a zero-length password" do
      fill_in "Username", with: "bobert"
      click_button "Sign In"
      expect(page).to have_content "Invalid username and/or password"
    end

    scenario "validates password is at least six characters" do
      fill_in "Username", with: "bobert"
      fill_in "Password", with: "short"
      click_button "Sign In"
      expect(page).to have_content "Invalid username and/or password"
    end

  end
end
