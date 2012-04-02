class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :text
      t.integer :user_id
      t.integer :owner_id
      t.string :owner_type

      t.timestamps
    end
  end
end

