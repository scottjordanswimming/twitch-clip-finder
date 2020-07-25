class CreateJoinTableStreamerUsers < ActiveRecord::Migration[6.0]
  def change
    create_join_table :streamer, :users do |t|
       t.index [:streamer_id, :user_id]
       t.index [:user_id, :streamer_id]
    end
  end
end
