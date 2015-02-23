class CreateUserTable < ActiveRecord::Migration
  def change
    create_table :users do |table|
      table.string :email
      table.string :password
      table.timestamps
    end
  end
end
