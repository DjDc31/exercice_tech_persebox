class RenameProductModelToKeywordAndRemoveBrandFromAlerts < ActiveRecord::Migration[7.0]
  def change
    rename_column :alerts, :product_model, :keyword
    remove_column :alerts, :brand, :string
  end
end
