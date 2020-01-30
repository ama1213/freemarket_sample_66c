class RemoveColumnPrefecture1 < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :prefecture1, :string, null: false
  end
end
