class CreateActivities < ActiveRecord::Migration[7.2]
  def change
    create_table :activities do |t|
      t.references :user, null: false, foreign_key: true
      t.string :action
      t.text :details
      t.datetime :performed_at

      t.timestamps
    end
  end
end
