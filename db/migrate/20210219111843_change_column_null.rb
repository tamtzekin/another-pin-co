class ChangeColumnNull < ActiveRecord::Migration[6.1]
  def change
    change_column_null :order_items, :order_id, true
  end
  
end
