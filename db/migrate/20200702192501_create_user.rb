class CreateUser < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.integer :review_id
      t.integer :clip_id
      t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    end
  end
end
