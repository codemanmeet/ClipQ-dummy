class RemovePictureFromContents < ActiveRecord::Migration
  def change
  	remove_column :contents, :picture
  	remove_column :contents, :opened
  	remove_column :contents, :tag
  end
end
