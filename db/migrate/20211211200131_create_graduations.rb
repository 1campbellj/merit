class CreateGraduations < ActiveRecord::Migration[6.1]
  def change
    create_table :graduations do |t|
      t.references :user, null: false
      t.references :degree, null: false
      t.integer :year

      t.timestamps
    end
  end
end
