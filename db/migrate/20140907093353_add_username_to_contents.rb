class AddUsernameToContents < ActiveRecord::Migration
  def change
  	add_column :contents, :username, :string
  	remove_column :contents, :opened
  end
end
