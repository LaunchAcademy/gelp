require 'spec_helper'

describe RubyGem do
  # before(:each) do
  # FactoryGirl.create(:ruby_gem)
  let!(:ruby_gem) { FactoryGirl.create(:ruby_gem) }
  

  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
  it { should validate_presence_of(:description) }
  it { should have_valid(:author).when('Laura Gemwriter', 'Person') }
  it { should have_valid(:github_url).when('http://www.github.com', 'http://www.github.com/laura') }
  it { should_not have_valid(:github_url).when('github.com', 'www.github.com', 'www.github', 'http://www.github')}

end
