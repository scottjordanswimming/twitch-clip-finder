class CreateJoinTableReviewedClips < ActiveRecord::Migration[6.0]
  def change
    create_join_table :reviews, :clips do |t|
      t.index [:review_id, :clip_id]
      t.index [:clip_id, :review_id]
    end
  end
end
