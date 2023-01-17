class CreateClassmates < ActiveRecord::Migration[7.0]
  def change
    create_table :classmates do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
