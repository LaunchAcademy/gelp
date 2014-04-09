# require 'spec_helper'

# feature "Admin has site privileges", %Q{
#   As an administrator
#   I want special privileges over users
#   So that I can moderate the site
# } do

# # Admin can delete a gem
# # Admin can delete a review
# # Admin can delete a user


# # (also admin can view a list of users)

#   before :each do
#     @ruby_gem = FactoryGirl.create(:ruby_gem)
#     @user = FactoryGirl.create(:user)
#     @admin = FactoryGirl.create(:user, role: 'admin')
#   end

#   scenario "Admin deletes gems" do
#     sign_in_as(@admin)
#     visit ruby_gems_path(@ruby_gem)
#     #DELETE A GEM
#   end

#   # scenario "Admin deletes reviews" do
#   #   sign_in_as(@admin)
#   #   visit ruby_gems_path(@ruby_gem)

#   #   # Reviews not yet merged in
#   # end

#   scenario "Admin deletes users" do
#     sign_in_as(@admin)
#     visit ruby_gems_path(@ruby_gem)

#     visit users_path(@user)

#     expect(page).to have_content(@user.first_name)
#     expect(page).to have_content('Delete User')

#     # DELETE USER
#   end

#   # scenario "User cannot see Admin options" do

#   # end
