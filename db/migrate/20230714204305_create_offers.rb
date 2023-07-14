class CreateOffers < ActiveRecord::Migration[7.0]
  def change
    create_table :offers do |t|
      t.references :user, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.decimal :price
      t.boolean :extra
      t.text :content
      t.string :photo
      t.string :language
      t.string :etat

      t.timestamps
    end
  end
end
