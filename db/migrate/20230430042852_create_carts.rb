class CreateCarts < ActiveRecord::Migration[7.0]
  def change
    create_table :carts do |t|
      t.belongs_to :product
      t.belongs_to :user
      t.integer :quantity, default: 1

      t.timestamps
    end
  end
end
