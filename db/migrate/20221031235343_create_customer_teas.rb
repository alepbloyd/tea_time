class CreateCustomerTeas < ActiveRecord::Migration[5.2]
  def change
    create_table :customer_teas do |t|
      t.references :customer, foreign_key: true
      t.references :tea, foreign_key: true

      t.string :title
      t.float :price
      t.integer :frequency
      t.boolean :status
    end
  end
end
