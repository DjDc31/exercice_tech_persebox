class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :marque
      t.string :modele
      t.decimal :price
      t.text :content
      t.integer :longueur
      t.integer :hauteur
      t.integer :largeur
      t.string :etat
      t.string :couleur
      t.text :extra
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
