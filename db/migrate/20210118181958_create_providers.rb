class CreateProviders < ActiveRecord::Migration[6.0]
  def change
    create_table :providers do |t|
      t.string :name
      t.string :description
      t.integer :rate
      t.references :user, null: false, foreign_key: true
      t.string :service_type
      t.string :location

      t.timestamps
    end
  end
end
