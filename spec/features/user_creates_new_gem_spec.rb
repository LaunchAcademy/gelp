require 'spec_helper'

feature "User creates new gem", %Q{
  As an authenticated user
  I want to add an item to be reviewed
  So I can add to the database of gems
} do

# I must provide a unique gem name
# I can optionally provide the gem author
# I must provide a description
# I can optionally provide a github url
# Error if I don’t provide gem name
# Error if gem already exists with that name
# Error if I don't provide a description

  scenario "With valid attributes" do

    visit new_gem_path
    fill_in "Name", with: "Gemmmm"
    fill_in "Author", with: "Captain Gemmy"
    fill_in "Description", with: "Another fantastic gem from Captain Gemmy"
    fill_in "Github URL", with: "www.github.com"

    click_on "Add gem!"

    expect(page).to have_content ("Gemmmm")
    expect(page).to have_content ("Another fantastic gem from Captain Gemmy")
    expect(page).to have_content ("Successfully added gem")
  end
end
