require 'spec_helper'

feature "Admin views user index", %Q{
  As an administrator
  I want to look at a list of users
  So that I can delete users
} do

  before :each do
    @user = FactoryGirl.create(:user)
    @admin = FactoryGirl.create(:user, admin: true)
  end

  scenario "Admin sees user index" do
    sign_in_as(@admin)
    visit admin_users_path

    expect(page).to have_content(@user.first_name)
    expect(page).to have_content(@admin.last_name)
  end

  scenario "an unauthenticated user tries to visit user index" do
    visit admin_users_path

    expect(page).to have_content("The page you were looking for doesn't exist (404)")
  end

  scenario "a non-admin user tries to visit user index" do
    sign_in_as(@user)
    visit admin_users_path

    expect(page).to have_content("The page you were looking for doesn't exist (404)")
  end
end
