class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.integer :upvote
      t.integer :downvote
      t.string :question
      t.string :video
      t.string :picture
      t.string :tag

      t.timestamps
    end
  end
end
