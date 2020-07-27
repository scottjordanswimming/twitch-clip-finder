class AddFavoriteToStreamerUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :streamer_users, :favorite, :boolean
  end
end
