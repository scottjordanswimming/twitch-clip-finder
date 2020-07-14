class AddFavoriteToClipStreamers < ActiveRecord::Migration[6.0]
  def change
    add_column :clip_streamers, :favorite, :boolean
  end
end
