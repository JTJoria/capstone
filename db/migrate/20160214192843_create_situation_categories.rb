class CreateSituationCategories < ActiveRecord::Migration
  def change
    create_table :situation_categories do |t|
      t.integer :category_id
      t.integer :situation_id
      t.boolean :required

      t.timestamps
    end
  end
end
