class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.integer :rating, null: false
      t.integer :ruby_gem_id, null: false #how do I include range validation here?
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
