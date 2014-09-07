class CreateContentvotes < ActiveRecord::Migration
  def change
    create_table :contentvotes do |t|
      t.integer :upvote
      t.integer :downvote
      t.integer :secret_id

      t.timestamps
    end
  end
end
