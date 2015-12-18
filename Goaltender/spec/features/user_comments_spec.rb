require 'spec_helper'
require 'rails_helper'

feature "user comments" do
  before :each do
    user = User.create!(username: "bobert", password: "password")
    user2 = User.create!(username: "boberta", password: "password")
    user.comments.create!(commenter_id: user2.id,
      body: "Awesome goal, person! I am totally not a robot!")
  end

  scenario "user show page displays user comments" do
    sign_in_as_bobert
    expect(page).to have_content "Awesome goal, person! I am totally not a robot!"
  end

  scenario "can comment on any user's page" do
    sign_in("boberta")
    visit user_url(User.first)
    make_a_comment("Bloopy!")
    expect(page).to have_content "Bloopy!"
  end

  scenario "new comments are displayed after completion" do
    sign_in_as_bobert
    expect(page).to_not have_content "Yippeee!"
    make_a_comment("Yippeee!")
    expect(page).to have_content "Yippeee!"
  end


end
