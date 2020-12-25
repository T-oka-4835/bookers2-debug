class RemovePostImageIdFromPostComments < ActiveRecord::Migration[5.2]
  def change
    remove_column :post_comments, :name, :integer
  end
end
