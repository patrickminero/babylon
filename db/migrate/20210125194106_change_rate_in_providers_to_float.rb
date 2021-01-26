class ChangeRateInProvidersToFloat < ActiveRecord::Migration[6.0]
  def change
    change_column :providers, :rate, :decimal, precision: 2
  end
end
