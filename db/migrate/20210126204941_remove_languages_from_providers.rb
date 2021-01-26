class RemoveLanguagesFromProviders < ActiveRecord::Migration[6.0]
  def change
    remove_column :providers, :languages, :string
  end
end
