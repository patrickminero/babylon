class ChangeLanguagesToStringProviders < ActiveRecord::Migration[6.0]
  def change
    change_column :providers, :languages, :string
  end
end
