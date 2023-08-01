class AddReadToAlerts < ActiveRecord::Migration[7.0]
  def change
    add_column :alerts, :read, :boolean, default: false
  end
end
