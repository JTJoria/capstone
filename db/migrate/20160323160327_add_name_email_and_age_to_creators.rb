class AddNameEmailAndAgeToCreators < ActiveRecord::Migration
  def change
    add_column :creators, :name, :string
    add_column :creators, :gender, :string
    add_column :creators, :age, :integer
  end
end
