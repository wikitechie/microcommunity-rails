class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :user_id
      t.string :verb
      t.integer :action_object_id
      t.string :action_object_type
      t.integer :target_object_id
      t.string :target_object_type

      t.timestamps
    end
  end
end
