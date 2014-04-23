require 'spec_helper'

describe Vote do
  let!(:vote) {FactoryGirl.create(:vote) }

  it {should validate_presence_of(:review_id)}
  it {should validate_presence_of(:user_id)}
  it {should validate_presence_of(:vote_type)}
  it {should belong_to(:user)}
  it {should belong_to(:review)}
  it {should validate_uniqueness_of(:user_id).scoped_to(:review_id)}

end
