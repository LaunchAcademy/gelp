class AddImageToRubyGems < ActiveRecord::Migration
  def change
    add_column :ruby_gems, :image, :string
  end
end
