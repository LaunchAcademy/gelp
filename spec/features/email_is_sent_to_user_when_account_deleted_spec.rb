require 'spec_helper'

feature 'user is sent a notification email when account is deleted by admin', %Q{
  As an authenticated user
  I want to receive an email when my account is deleted
  So that I am informed that my account no longer exists
} do

  #Acceptance Criteria
  #When an admin deletes an account, the account owner is automatically sent an email notifying him of the action

  scenario 'account is deleted by admin' do
    ActionMailer::Base.deliveries = []
    user = FactoryGirl.create(:user)
    admin = FactoryGirl.create(:user, admin: true)


    sign_in_as(admin)
    visit admin_users_path
    click_on "Delete User #{user.email}"

    expect(ActionMailer::Base.deliveries.size).to eql(1)

    last_email = ActionMailer::Base.deliveries.last
    expect(last_email).to have_subject('Your Account was Deleted!')
    expect(last_email).to deliver_to(user.email)
    expect(last_email).to have_body_text("Hello #{user.first_name}")
  end
end
