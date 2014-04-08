require 'spec_helper'

feature 'user edit review', %Q{
As a user
I want to be able to edit my review
So i can update my thoughts on the review
} do

#Acceptance Criteria
#A User can edit a review that he/she created

 scenario 'signed in user edits their review' do
    ruby_gem = FactoryGirl.create(:ruby_gem)
    user = FactoryGirl.create(:user)
    review = FactoryGirl.create(:review, user: user, ruby_gem: ruby_gem)
    sign_in_as(user)
    visit ruby_gems_path
    click_on ruby_gem.name
    click_on 'Edit Review'
    fill_in 'Title', with: "gem name"
    fill_in 'Body', with: 'ruby gem review'
    select '5', from: 'Rating'
    click_on 'Update Review'


    expect(page).to have_content("Review Successfully Updated")
    expect(current_path).to eql(ruby_gem_path(ruby_gem))
    expect(Review.first.body).to eql('ruby gem review')
 end
end
