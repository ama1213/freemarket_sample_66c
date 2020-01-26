class AddCategoryChildrenToProducts < ActiveRecord::Migration[5.2]
  def up
    add_column :products, :category_children, :string, null: false, default: ''
  end

  def down
    remove_column :products, :category_children, :string, null: false, default: ''
  end
end