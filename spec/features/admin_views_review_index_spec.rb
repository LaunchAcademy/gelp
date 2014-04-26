require 'spec_helper'

feature "Admin views review index", %Q{
  As an administrator
  I want to look at a list of reviews
  So that I can delete reviews
} do

  before :each do
    @user = FactoryGirl.create(:user)
    @admin = FactoryGirl.create(:user, admin: true)
    @review = FactoryGirl.create(:review)
  end

  scenario "Admin sees review index" do
    sign_in_as(@admin)
    visit admin_reviews_path

    expect(page).to have_content(@review.title)
    expect(page).to have_content(@review.body)
  end

  scenario "an unauthenticated user tries to visit review index" do
    visit admin_reviews_path

    expect(page).to have_content("The page you were looking for doesn't exist (404)")
  end

  scenario "a non-admin user tries to visit review index" do
    sign_in_as(@user)
    visit admin_reviews_path

    expect(page).to have_content("The page you were looking for doesn't exist (404)")
  end
end
