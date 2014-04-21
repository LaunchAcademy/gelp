require 'spec_helper'

describe Vote do
  it {should validate_presence_of(:review_id)}
  it {should validate_presence_of(:user_id)}
  it {should validate_presence_of(:vote_type)}
  it {should belong_to(:user)}
  it {should belong_to(:review)}
  # it {should validate_uniqueness_of(:user).scoped_to(:review)}
  # will need to fix this
end
