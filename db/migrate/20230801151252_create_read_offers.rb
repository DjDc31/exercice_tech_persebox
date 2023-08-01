class CreateReadOffers < ActiveRecord::Migration[7.0]
  def change
    create_table :read_offers do |t|
      t.references :user, null: false, foreign_key: true
      t.references :alert, null: false, foreign_key: true
      t.references :offer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
