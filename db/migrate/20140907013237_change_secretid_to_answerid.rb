class ChangeSecretidToAnswerid < ActiveRecord::Migration
  def change
  	remove_column :contents, :opened, :boolean
  end
end
