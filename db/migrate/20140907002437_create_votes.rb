class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :votable_id
      t.string :votable_type
      t.integer :voter_id
      t.string :voter_type
      t.boolean :vote_flag
      t.string :vote_scope
      t.string :vote_weight

      t.timestamps
    end
  end
end
