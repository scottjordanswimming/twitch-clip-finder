class RemoveClipIdFromReviews < ActiveRecord::Migration[6.0]
  def change
    remove_column :reviews, :clip_id, :integer
  end
end
