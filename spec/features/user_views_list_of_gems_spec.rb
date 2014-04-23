require 'spec_helper'
feature "User views a list of gems", %Q{
  As an authenticated user
  I want view a list of gems
  So I can see their reviews
} do


scenario "I want to view a list of gems" do
  rubygems = FactoryGirl.create_list(:ruby_gem, 2)

    visit ruby_gems_path

    rubygems.each do |rubygem|
      expect(page).to have_content(rubygem.name)
    end
  end
end

#--------> CREATE INDEX




#   # ruby_gem1 = FactoryGirl.create(:ruby_gem)
#   # ruby_gem2 = FactoryGirl.create(:ruby_gem)

#   # visit ruby_gems_path
#   # expect(page).to have_content(ruby_gem1.name, ruby_gem1.description, ruby_gem2.name, ruby_gem2.description)

#   end

#   scenario "no gems have been created yet"

#   expect(page).to have_content("No gems have been created. Add a gem!")

# end


# scenario "no gems have been created yet"

