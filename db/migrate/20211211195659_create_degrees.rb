class CreateDegrees < ActiveRecord::Migration[6.1]
  def change
    create_table :degrees do |t|
      t.string :name

      t.timestamps
    end
  end
end
