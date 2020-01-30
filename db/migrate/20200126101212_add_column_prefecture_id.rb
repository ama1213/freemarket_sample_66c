class AddColumnPrefectureId < ActiveRecord::Migration[5.2]
  def up
    add_column :users, :prefecture_id, :string, null: false
  end
  
  def down
    remove_column :users, :prefecture_id, :string, null: false
  end
end