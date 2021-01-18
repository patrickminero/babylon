class RemoveLanguagesSpokenFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :languages_spoken
  end
end
