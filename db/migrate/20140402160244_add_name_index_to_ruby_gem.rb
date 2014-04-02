class AddNameIndexToRubyGem < ActiveRecord::Migration
  def change
    add_index :ruby_gems, :name, unique: true
  end
end
