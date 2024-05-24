class RemoveUserNameInReview < ActiveRecord::Migration[7.1]
  def change
    remove_column :reviews, :user_name, :string
  end
end
