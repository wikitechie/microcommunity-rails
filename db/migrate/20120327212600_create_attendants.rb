class CreateAttendants < ActiveRecord::Migration
  def change
    create_table :attendants do |t|
      t.integer :user_id
      t.integer :event_id

      t.timestamps
    end
  end
end
