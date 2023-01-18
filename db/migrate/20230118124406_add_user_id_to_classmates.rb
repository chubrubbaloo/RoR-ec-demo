class AddUserIdToClassmates < ActiveRecord::Migration[7.0]
  def change
    add_column :classmates, :user_id, :integer
    add_index :classmates, :user_id
  end
end
