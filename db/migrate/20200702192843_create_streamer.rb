class CreateStreamer < ActiveRecord::Migration[6.0]
  def change
    create_table :streamers do |t|
      t.string :name
      t.integer :clip_id
      t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    end
  end
end
