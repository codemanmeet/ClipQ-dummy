class AddOpenToContents < ActiveRecord::Migration
  def change
  	add_column :contents, :open, :boolean
  end
end
