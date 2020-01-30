class AddNotNullToImagesCreatedAt < ActiveRecord::Migration[5.2]
  def up
    change_column_null :images, :created_at, false, 0
    change_column :images, :created_at, :string, default: 0
  end

  def down
    change_column_null :images, :created_at, true, nil
    change_column :images, :created_at, :string, default: nil
  end
end
