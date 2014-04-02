class CreateRubyGems < ActiveRecord::Migration
  def change
    create_table :ruby_gems do |t|
      t.string :name, null: false
      t.string :author
      t.text :description, null: false
      t.string :github_url

      t.timestamps
    end
  end
end
