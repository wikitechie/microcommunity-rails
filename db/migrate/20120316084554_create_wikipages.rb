class CreateWikipages < ActiveRecord::Migration
  def change
    create_table :wikipages do |t|
      t.text :body
      t.integer :user_id

      t.timestamps
    end
  end
end
