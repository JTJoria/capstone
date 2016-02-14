class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.integer :trip_id
      t.string :name
      t.string :gender
      t.integer :age

      t.timestamps
    end
  end
end
