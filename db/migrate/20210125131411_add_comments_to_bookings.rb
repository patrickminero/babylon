class AddCommentsToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :comments, :text
  end
end
