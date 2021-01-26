class ChangeDataTypeForProviders < ActiveRecord::Migration[6.0]
  def self.up
    change_table :providers do |t|
      t.change :rate , :float
    end
  end
  def self.down
    change_table :providers do |t|
      t.change :rate, :decimal
    end
  end
end
