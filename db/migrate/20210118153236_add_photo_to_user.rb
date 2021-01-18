class AddPhotoToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :photo, :string, default: 'https://res.cloudinary.com/dliczkabg/image/upload/v1610983854/profile-silhouette_oychwo.jpg'
  end
end
