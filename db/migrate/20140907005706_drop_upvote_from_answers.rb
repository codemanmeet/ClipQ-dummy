class DropUpvoteFromAnswers < ActiveRecord::Migration
  def change
  	 remove_column :answers, :upvote
  	 remove_column :answers, :downvote
  	 add_column :answers, :video, :string
  	 add_column :answers, :picture, :string
  end
end
