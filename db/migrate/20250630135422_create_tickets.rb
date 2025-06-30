class CreateTickets < ActiveRecord::Migration[7.2]
  def change
    create_table :tickets do |t|
      t.references :event, null: false, foreign_key: true
      t.string :category
      t.decimal :price
      t.integer :available

      t.timestamps
    end
  end
end
