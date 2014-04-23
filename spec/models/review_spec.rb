require 'spec_helper'

describe Review do
  it {should validate_presence_of(:title)}
  it {should validate_presence_of(:body)}
  it {should validate_presence_of(:rating)}
  it {should validate_presence_of(:user_id)}
  it {should validate_presence_of(:ruby_gem_id)}
  it {should ensure_inclusion_of(:rating).in_array(%w[1 5])}
  it {should belong_to(:user)}
  it {should belong_to(:ruby_gem)}
  it {should have_many(:votes).dependent(:destroy)}
end
