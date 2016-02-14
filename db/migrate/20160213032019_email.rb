class Email < ActiveRecord::Migration
  def change
    create_table :creator do |t|
      t.string :email
      t.string :password
    end
  end
end
