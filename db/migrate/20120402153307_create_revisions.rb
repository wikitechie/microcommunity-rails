class CreateRevisions < ActiveRecord::Migration
  def change
    create_table :revisions do |t|
	t.column "user_id",:integer
	t.column "content",:text
	t.column "wikipage_id",:integer
	t.column "edit_title",:string
      t.timestamps
    end
  end
end
