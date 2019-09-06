class AddRentalsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :rentals do |t|
      t.integer :user_id
      t.bigint :product_id
      t.bigint :variant_id
      t.string :checkout_url
      t.timestamp :start_date
      t.integer :duration
        
      t.timestamps null: false
    end
  end
end
