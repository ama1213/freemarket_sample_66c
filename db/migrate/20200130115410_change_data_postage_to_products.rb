class ChangeDataPostageToProducts < ActiveRecord::Migration[5.2]
  def change
    change_column :products, :postage, :string
  end
end
