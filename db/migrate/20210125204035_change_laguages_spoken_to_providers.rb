class ChangeLaguagesSpokenToProviders < ActiveRecord::Migration[6.0]
  def change
    change_column :providers, :languages_spoken, :string, array: true, default: []
  end
end
