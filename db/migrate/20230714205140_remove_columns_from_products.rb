class RemoveColumnsFromProducts < ActiveRecord::Migration[7.0]
  def change
    remove_column :products, :etat, :string
    remove_column :products, :extra, :text
    remove_column :products, :language, :string
    remove_column :products, :user_id, :bigint
  end
end
