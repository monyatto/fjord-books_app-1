class ChangeCloumnsNotnullAddFollows < ActiveRecord::Migration[6.1]
  def change
    change_column :follows, :follower_id, :integer, null: false
    change_column :follows, :followed_id, :integer, null: false
  end
end
