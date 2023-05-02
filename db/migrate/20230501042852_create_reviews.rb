class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.belongs_to :product
      t.string :rev
      t.integer :rating
      t.string :username
      t.timestamps
    end
  end
end
