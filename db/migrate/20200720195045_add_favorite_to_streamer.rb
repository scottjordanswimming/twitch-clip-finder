class AddFavoriteToStreamer < ActiveRecord::Migration[6.0]
  def change
    add_column :streamers, :favorite, :boolean
  end
end
