require "spec_helper"
require "rails_helper"

feature "the show page" do
  before :each do
    user = User.create!(username: "bobert", password: "password")
    5.times do |eye|
      user.goals.create!(title: "jump high" + eye.to_s,
        body: "jump over the moon", exposure: "public")
    end
    Goal.last.exposure = "private"
  end

  scenario "it displays all the user's goals to the user" do
    sign_in_as_bobert
    expect(page).to have_content("jump high0")
    expect(page).to have_content("jump high4")
  end

  scenario " " do
    
  end
end
