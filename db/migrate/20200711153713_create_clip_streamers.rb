class CreateClipStreamers < ActiveRecord::Migration[6.0]
  def change
    create_table :clip_streamers do |t|
      t.integer :clip_id
      t.integer :streamer_id

      t.timestamps
    end
  end
end
