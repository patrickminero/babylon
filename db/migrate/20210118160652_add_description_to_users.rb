class AddDescriptionToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :description, :text, default: 'Tell us about you...'
  end
end
