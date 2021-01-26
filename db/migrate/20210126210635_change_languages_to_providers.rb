class ChangeLanguagesToProviders < ActiveRecord::Migration[6.0]
  def change
    change_column_default :providers, :languages, nil
  end
end
