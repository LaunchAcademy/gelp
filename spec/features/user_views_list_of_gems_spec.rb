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

