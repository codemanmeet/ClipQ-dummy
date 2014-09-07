class AddCategoryToContents < ActiveRecord::Migration
  def change
  	remove_column :contents, :question
  	remove_column :contents, :open
  	add_column :contents, :categ, :string
  end
end
