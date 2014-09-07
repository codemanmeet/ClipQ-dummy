class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :upvote
      t.integer :downvote
      t.string :comment

      t.timestamps
    end
  end
end
