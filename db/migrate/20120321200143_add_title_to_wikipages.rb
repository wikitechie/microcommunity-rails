class AddTitleToWikipages < ActiveRecord::Migration
  def change
    add_column :wikipages, :title, :string
  end
end
