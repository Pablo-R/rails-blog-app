class ChangeRoleTypeInUsers < ActiveRecord::Migration[5.1]

  def up
    change_column :users, :role, :string
  end

  def down
    change_column :users, :role, :boolean    
  end
end