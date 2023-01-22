class CreateGrades < ActiveRecord::Migration[7.0]
  def change
    create_table :grades do |t|
      t.string :code
      t.string :course
      t.string :points
      t.string :grade

      t.timestamps
    end
  end
end
