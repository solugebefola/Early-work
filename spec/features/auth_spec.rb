require 'spec_helper'
require 'rails_helper'

feature "the signup process" do
  before :each do
    visit new_user_url
  end
  scenario "it has a new user page" do
    expect(page).to have_content "Sign Up"
  end

    feature "signing up a user" do
      scenario "shows username on the homepage after signup" do


      end

    end

end
