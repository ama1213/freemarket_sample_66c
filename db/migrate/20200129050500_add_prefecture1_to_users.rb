class AddPrefecture1ToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :prefecture1, :string
  end
end
