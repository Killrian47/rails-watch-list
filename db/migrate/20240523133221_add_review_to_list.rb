class AddReviewToList < ActiveRecord::Migration[7.1]
  def change
    add_column :lists, :review, :text
  end
end
