class AddSrcToImages < ActiveRecord::Migration[5.2]
  def up
    add_column :images, :src, :string
  end
  
  def down
    remove_column :images, :src, :string
  end
end
