require 'spec_helper'

feature 'user sign out', %Q{
  As an authenticated user
  I want to sign out
  So that I can exit the system
} do


  scenario 'A signed-in user can log out of his account' do
    user = FactoryGirl.create(:user)
    sign_in_as(user)
    click_on 'Sign Out'

    expect(page).to have_content("Signed out successfully")
    expect(current_path).to eql(root_path)
  end
end
