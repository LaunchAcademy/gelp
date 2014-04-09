require 'spec_helper'

feature "Admin has site privileges", %Q{
  As an administrator
  I want special privileges over users
  So that I can moderate the site
} do

# Admin can delete a gem
# Admin can delete a review
# Admin can delete a user

  before :each do
    @ruby_gem = FactoryGirl.create(:ruby_gem)
    @user = FactoryGirl.create(:user)
    @admin = FactoryGirl.create(:user, admin: true)
  end

  scenario "Admin deletes gems" do
    sign_in_as(@admin)
    visit ruby_gems_path

    expect(page).to have_content(@ruby_gem.name)
    expect(page).to have_content('Delete Gem')

    click_on 'Delete Gem'
    expect(page).to_not have_content(@ruby_gem.name)
  end

  # scenario "Admin deletes reviews" do
  #   sign_in_as(@admin)
  #   visit reviews_path
  #   expect(page).to have_content(@review.IDONOTKNOWYET!)
  #   expect(page).to have_content('Delete User')

  #   click_on 'Delete Gem'

  #   expect(page).to_not have_content(@user.first_name)

  # # Reviews not yet merged in
  # end

  scenario "Admin deletes users" do
    sign_in_as(@admin)
    visit admin_users_path

    expect(page).to have_content(@user.email)
    expect(page).to have_content("Delete User #{@user.email}")

    click_on "Delete User #{@user.email}"
    expect(page).to_not have_content(@user.email)
    expect(page).to have_content(@admin.email)
  end

  scenario "User cannot see Admin options" do
    sign_in_as(@user)
    visit ruby_gem_path
    expect(page).to have_content(@ruby_gem.name)
    expect(page).to_not have_content('Delete User')
  end
end
