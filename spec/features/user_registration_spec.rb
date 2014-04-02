require 'spec_helper'

feature 'user signs up', %Q{
  As a non-user
  I want to register for the site
  So I can be a contributing member
  } do

    #ACCEPTANCE CRITERIA
    #*I must provide a first name and last name
    #*I must provide a unique email address
    #*I must provide a password
    #*I must provide a password confirmation
    #*If I do not provide the required information, I get an error message
    #*If the email I provide is already registered, I receive an error message
    #*If my password & password confirmation do not match, I receive an error message

    scenario 'user specifies valid and required information' do
      visit root_path
      click_link 'Sign Up'
      fill_in 'Email', with: 'user@example.com'
      fill_in 'user_password', with: 'password'
      fill_in 'First name', with: 'John'
      fill_in 'Last name', with: 'Smith'
      fill_in 'Password confirmation', with: 'password'
      click_button 'Sign up'


      expect(page).to have_content("Sign Out")
      expect(page).to have_content ("You're in!")
      expect(current_path).to eql(root_path)

    end


    scenario 'required information is not supplied' do
      visit root_path
      click_link 'Sign Up'
      click_button 'Sign up'

      expect(page).to have_content("can't be blank")
      expect(page).to_not have_content("Sign Out")
    end

    scenario 'email is already registered' do
      FactoryGirl.create(:user)
      visit root_path
      click_link 'Sign Up'
      fill_in 'Email', with: 'foo@foobar.com'
      fill_in 'user_password', with: 'password'
      fill_in 'First name', with: 'John'
      fill_in 'Last name', with: 'Smith'
      fill_in 'Password confirmation', with: 'password'
      click_button 'Sign up'

      expect(page).to have_content("Emailhas already been taken")
      expect(page).to_not have_content("Sign Out")
    end


    scenario 'password confirmation does not match' do
      visit root_path
      click_link 'Sign Up'

      fill_in 'user_password', with: 'password'
      fill_in 'Password confirmation', with: 'anotherpasssword'
      click_button 'Sign up'

      expect(page).to have_content ("doesn't match Password")
      expect(page).to_not have_content("Sign Out")
    end



end
