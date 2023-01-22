class AddUserIdToGrades < ActiveRecord::Migration[7.0]
  def change
    add_column :grades, :user_id, :integer
    add_index :grades, :user_id #adds index to quickly find a grade for a specific user.
  end
end
