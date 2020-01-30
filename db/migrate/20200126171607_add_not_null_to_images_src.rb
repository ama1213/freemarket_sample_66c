class AddNotNullToImagesSrc < ActiveRecord::Migration[5.2]
  def up
    change_column_null :images, :src, false, 0
    change_column :images, :src, :string, default: 0
  end

  def down
    change_column_null :images, :src, true, nil
    change_column :images, :src, :string, default: nil
  end
end
