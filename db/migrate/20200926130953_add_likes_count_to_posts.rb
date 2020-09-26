class AddLikesCountToPosts < ActiveRecord::Migration[6.0]
  def up
    add_column :posts, :likes_count, :integer
    Post.find_each{|post| Post.reset_counters(post.id, :likes_count)}
  end
  
  def down
    remove_column :posts, :likes_count, :integer
  end
  
end
