class AddBooleanValueToGarments < ActiveRecord::Migration
  def change
    add_column :garments, :packed, :boolean, :default => false
  end
end
