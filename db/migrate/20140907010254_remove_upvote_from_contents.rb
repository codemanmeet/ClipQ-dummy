class RemoveUpvoteFromContents < ActiveRecord::Migration
  def change
  	remove_column :contents, :upvote
  	remove_column :contents, :downvote
  end
end
