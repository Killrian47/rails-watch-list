class AddUserNameInReview < ActiveRecord::Migration[7.1]
  def change
    add_column :reviews, :user_name, :string
  end
end
