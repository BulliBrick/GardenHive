class CreateThemes < ActiveRecord::Migration[7.2]
  def change
    create_table :themes do |t|
      t.string :theme_name

      t.timestamps
    end
  end
end
