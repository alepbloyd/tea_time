class CreateTeas < ActiveRecord::Migration[5.2]
  def change
    create_table :teas do |t|
      t.string :name
      t.string :description
      t.float :temperature
      t.integer :brew_time

      t.timestamps
    end
  end
end
