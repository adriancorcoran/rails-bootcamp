class AddProductNameToRental < ActiveRecord::Migration[6.0]
  def change
    add_column :rentals, :product_name, :string, :after => :product_id
    add_column :rentals, :variant_name, :string, :after => :variant_id
  end
end
