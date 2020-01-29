class RenamePrefecture1ColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :prefecture1, :prefecture_id
  end
end
