class RemoveColumnSrc < ActiveRecord::Migration[5.2]
  def change
    remove_column :images, :src, :string, null: false
  end
end
