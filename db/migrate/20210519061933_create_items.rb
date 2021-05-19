class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :explain, null: false
      t.integer :category_id, null: false
      t.integer :status_id, null: false
      t.integer :deli_change_id, null: false
      t.integer :pref_id, null: false
      t.integer :deli_days_id, null: false
      t.integer :price, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
