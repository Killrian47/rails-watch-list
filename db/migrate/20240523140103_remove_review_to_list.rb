class RemoveReviewToList < ActiveRecord::Migration[7.1]
  def change
    remove_column :lists, :review, :text
  end
end
