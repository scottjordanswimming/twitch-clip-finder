class CreateClips < ActiveRecord::Migration[6.0]
  def change
    create_table :clips do |t|
      t.string :title
      t.string :url

      t.timestamps
    end
  end
end
