require 'spec_helper'

feature 'user votes on an existing review', %Q{
  As an authenticated user
  I want to vote on an existing review
  So that I can express my opinion on a review
} do 

# For each review on a gem’s page, there is a upvote or a downvote button:
# If I have not yet voted on the review, there is both an up and a downvote button
# If I upvoted the review, there is a downvote button only
# If I downvoted the review, there is an upvote button only
# Clicking on a voting button will add one to the tally without refreshing the page
# I cannot record more than one vote for a given review
  before :each do 
    user = FactoryGirl.create(:user)
      sign_in_as(user)
      review = FactoryGirl.create(:review)
      ruby_gem = FactoryGirl.create(:ruby_gem)
      visit ruby_gem_path(ruby_gem)
    end


  scenario 'there is an upvote and downvote button' do
    
    expect(page).to have_content('Upvote') 
    expect(page).to have_content('Downvote')
  end

  scenario 'user clicks on upvote button' do

    click_on 'Upvote'
    expect(page).to_not have_content('Upvote')
    expect(page).to have_content('Downvote')
    expect(page).to have_content('1')

  end

  scenario 'user clicks on downvote button' do

    click_on 'Downvote'
    expect(page).to_not have_content('Downvote')
    expect(page).to have_content('Upvote')
    expect(page).to have_content('-1')

  end

end