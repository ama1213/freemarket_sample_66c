class AddNotNullToImagesUpdatedAt < ActiveRecord::Migration[5.2]
  def up
    change_column_null :images, :updated_at, false, 0
    change_column :images, :updated_at, :string, default: 0
  end

  def down
    change_column_null :images, :updated_at, true, nil
    change_column :images, :updated_at, :string, default: nil
  end
end
