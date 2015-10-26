require "spec_helper"
require "rails_helper"

feature "the show page" do
  before :each do
    user = User.create!(username: "bobert", password: "password")
    5.times do |eye|
      user.goals.create!(title: "jump high" + eye.to_s, exposure: "public")
    end
    g = Goal.last
    g.exposure = "private"
    g.save!
    sign_in_as_bobert
    visit user_url(user)
  end

  scenario "does not show the goal page unless signed in" do
    sign_out
    visit user_url(User.first)
    expect(page).to have_content "Sign In"
  end

  scenario "it displays all the user's goals to the user" do
    expect(page).to have_content("jump high0")
    expect(page).to have_content("jump high4")
  end

  scenario "it does not display private goals to other users" do
    sign_up("boberta")
    visit user_url(User.first)
    expect(page).to have_content("jump high0")
    expect(page).to_not have_content("jump high4")
  end

  scenario "it should have a link to new goal page" do
    expect(page).to have_content("Add a New Goal")
  end

  scenario "should have links to edit goals" do
    expect(page).to have_content("Edit")
  end

  scenario "should not have edit goal links on other user's page" do
    sign_up("boberta")
    visit user_url(User.first)
    expect(page).to_not have_content("Edit")
  end

  scenario "should have link for delete goal" do
    expect(page).to have_content("Delete")
  end

  scenario "clicking new goal link should lead to new goal page" do
    click_link "Add a New Goal"
    expect(page).to have_content("Create New Goal")
  end

  scenario  "clicking edit link should lead to edit goal page" do
    page.first(:link,"Edit").click
    #click_link "Edit"
    expect(page).to have_content("Edit jump high0")
  end

  scenario "clicking delete should remove goal" do
    page.first(:button,"Delete").click
    expect(page).to_not have_content("jump high0")
  end

  scenario "clicking 'Complete' marks a goal as complete" do
    page.first(:button, "Mark as Completed!").click
    expect(page).to have_content("Complete!")
  end
end
