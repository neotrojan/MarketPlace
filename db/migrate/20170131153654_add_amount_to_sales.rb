class AddAmountToSales < ActiveRecord::Migration[5.0]
  def change
    add_column :sales, :amount, :integer
  end
end
