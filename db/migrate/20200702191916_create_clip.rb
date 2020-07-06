class CreateClip < ActiveRecord::Migration[6.0]
  def change
    create_table :clips do |t|
      t.string :title
      t.string :url
      t.integer :streamer_id
      t.integer :user_id
      t.integer :review_id
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
    end
  end
end
