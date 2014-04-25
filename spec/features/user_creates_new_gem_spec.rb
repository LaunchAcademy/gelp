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

  # let(:ruby_gem) { FactoryGirl.build(:ruby_gem) }

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

# Helen this test is what I was talking to you about when you were leaving.
# It looks so stupid and I hate it, but it works, which I also hate.
# The commented part is what you had suggested, it looked like it was going to be much prettier.
# I was not smart enough for it. Saddness abounds.
# Signed,
# Your friend,
# Michael
#
# P.S. The github URL demands a URL, including http:// before it, despite us not making it do that.
# witchcraft is suspected.


   scenario "without required attributes" do
     click_on "Add Gem!"
     # expect(page).to have_content ("Gem not created")
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

    # expect(page).to have_content ("Gem not created")
    expect(page).to have_content ("Namehas already been taken")
  end
end
