require 'spec_helper'

describe RubyGem do
  before(:each) do
    FactoryGirl.create(:ruby_gem)
  end

  let(:blank_values) { [nil, ''] }

  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }

  it { should validate_presence_of(:description) }

  it { should have_valid(:name).when('Michael', 'Laura') }
  it { should_not have_valid(:name).when(*blank_values) }

  it { should have_valid(:description).when('THIS IS A VALID DESCIPTION', 'Laura??') }
  it { should_not have_valid(:description).when(*blank_values) }

  it { should have_valid(:author).when('Laura Gemwriter', 'Person') }

  it { should have_valid(:github_url).when('www.github.com', 'www.github.com/laura') }

end
