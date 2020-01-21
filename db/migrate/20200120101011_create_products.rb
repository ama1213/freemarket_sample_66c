class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name,          null: false
      t.text :detail,          null: false
      t.string :brand
      t.string :size
      t.string :price,         null: false
      t.string :status,        null: false
      t.string :situation,     null: false 
      t.integer :postage,      null: false
      t.string :method,        null: false
      t.string :area,          null: false
      t.references :user,       null: false, foreign_key: true
      t.timestamps
    end
  end
end
