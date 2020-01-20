class RenameTitleColumnToPrefecture1 < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :prefecture1, :prefecture_id
  end
end
