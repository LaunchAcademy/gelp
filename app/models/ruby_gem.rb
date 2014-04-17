class RubyGem < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true

  mount_uploader :image, ImageUploader
  has_many :reviews, dependent: :destroy

  validates :github_url, format: { with:  /\A(http|https):\/\/[A-z0-9]+([\-\.]{1}[A-z0-9]+)*\.[A-z]{2,5}(:[0-9]{1,5})?(\/.*)?\z/ix }

end
