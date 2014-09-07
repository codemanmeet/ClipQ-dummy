class AddUsernameToContents < ActiveRecord::Migration
  def change
  	add_column :contents, :username, :string
  	
  end
end
