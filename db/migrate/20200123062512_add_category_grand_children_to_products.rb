class AddCategoryGrandChildrenToProducts < ActiveRecord::Migration[5.2]
  def up
    add_column :products, :category_grand_children, :string, null: false, default: ''
  end

  def down
    remove_column :products, :category_grand_children, :string, null: false, default: ''
  end
end
