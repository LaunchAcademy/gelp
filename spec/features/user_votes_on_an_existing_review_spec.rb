require 'spec_helper'

feature 'user votes on an existing review', %Q{
  As an authenticated user
  I want to vote on an existing review
  So that I can express my opinion on a review
} do


  before :each do
    user = FactoryGirl.create(:user)
      sign_in_as(user)
      ruby_gem = FactoryGirl.create(:ruby_gem)
      review = FactoryGirl.create(:review, ruby_gem: ruby_gem)

      visit ruby_gem_path(ruby_gem)
    end

  scenario 'there is an upvote and downvote button' do

    expect(page).to have_button('Up')
    expect(page).to have_button('Down')
  end

  scenario 'user clicks on upvote button' do

    click_on 'Up'
    expect(page).to_not have_button('Up')
    expect(page).to have_button('Down')
    expect(page).to have_content('1')
  end

  scenario 'user clicks on downvote button' do

    click_on 'Down'
    expect(page).to_not have_button('Down')
    expect(page).to have_button('Up')
    expect(page).to have_content('-1')
  end
end
