class CreateAlerts < ActiveRecord::Migration[7.0]
  def change
    create_table :alerts do |t|
      t.references :user, null: false, foreign_key: true
      t.decimal :max_price
      t.string :brand
      t.string :product_model
      t.string :language
      t.string :state
      t.boolean :extra

      t.timestamps
    end
  end
end
