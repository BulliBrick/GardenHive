class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.references :user_role, null: false, foreign_key: true
      t.string :password_digest

      t.timestamps
    end
  end
end
