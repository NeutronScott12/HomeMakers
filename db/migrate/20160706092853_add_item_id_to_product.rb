class AddItemIdToProduct < ActiveRecord::Migration
  def change
    add_column :products, :item_id, :integer
  end
end
