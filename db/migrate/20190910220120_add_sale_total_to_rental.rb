class AddSaleTotalToRental < ActiveRecord::Migration[6.0]
  def change
    add_column :rentals, :sale_total, :float, :after => :variant_name
  end
end
