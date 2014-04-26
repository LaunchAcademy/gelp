require 'spec_helper'

feature "User creates new gem", %Q{
  As an authenticated user
  I want to add an item to be reviewed
  So I can add to the database of gems
} do

  before :each do
    @ruby_gem = FactoryGirl.build(:ruby_gem)
    visit new_ruby_gem_path
  end

  scenario "With valid attributes" do
    prev_count = RubyGem.count

    fill_in "Name", with: @ruby_gem.name
    fill_in "Author", with: @ruby_gem.author
    fill_in "Description", with: @ruby_gem.description
    fill_in "Github url", with: @ruby_gem.github_url

    click_on "Add Gem!"

    expect(page).to have_content (@ruby_gem.name)
    expect(page).to have_content (@ruby_gem.description)
    expect(page).to have_content ("Successfully added gem")
    expect(RubyGem.count).to eq prev_count + 1
  end

  scenario "without required attributes" do
     click_on "Add Gem!"
     expect(page).to have_content ("Namecan't be blank")
     fill_in "Name", with: @ruby_gem.name
     click_on "Add Gem!"

     expect(page).to have_content ("Descriptioncan't be blank")
   end

  scenario "gem already exists" do
    @ruby_gem.save
    fill_in "Name", with: @ruby_gem.name
    fill_in "Description", with: @ruby_gem.description
    click_on "Add Gem!"

    expect(page).to have_content ("Namehas already been taken")
  end
end
