require 'spec_helper'

feature "User creates a review for an existing gem", %Q{
  As an authenticated user
  I want to add a review for an existing gem
  So I can contribute my opinion to the website
} do


  scenario 'signed in user submits a valid review' do
    ruby_gem = FactoryGirl.create(:ruby_gem)
    user = FactoryGirl.create(:user)
    sign_in_as(user)
    visit ruby_gems_path
    click_on ruby_gem.name
    click_on 'Submit a Review'
    fill_in 'Title', with: "Great Gem"
    fill_in 'Body', with: 'This gem is great'
    choose "5"
    click_on 'Create Review'

    expect(page).to have_content("Successfully Submitted Review")
    expect(ruby_gem.reviews.count).to eql(1)
    expect(current_path).to eql(ruby_gems_path)
  end
end

