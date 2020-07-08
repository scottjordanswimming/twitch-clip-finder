class AddBodyToReview < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :body, :string
  end
end
