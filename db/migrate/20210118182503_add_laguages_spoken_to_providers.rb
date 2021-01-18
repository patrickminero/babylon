class AddLaguagesSpokenToProviders < ActiveRecord::Migration[6.0]
  def change
    add_column :providers, :languages_spoken, :string, array: true, default: [], using: "(string_to_array(languages, ','))"
  end
end
