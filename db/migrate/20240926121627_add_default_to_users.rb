class AddDefaultToUsers < ActiveRecord::Migration[7.2]
  def change
    change_column :users, :user_role, :string, default: 'user'
  end
end
