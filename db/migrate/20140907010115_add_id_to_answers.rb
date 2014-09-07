class AddIdToAnswers < ActiveRecord::Migration
  def change
  	add_column :answers, :secret_id, :integer
  end
end
