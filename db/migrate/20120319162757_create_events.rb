class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :place
      t.datetime :datetime
      t.integer :user_id

      t.timestamps
    end
  end
end
