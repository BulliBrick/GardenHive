class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :user_role
      t.string :password_digest

      t.timestamps
    end
  end
end
