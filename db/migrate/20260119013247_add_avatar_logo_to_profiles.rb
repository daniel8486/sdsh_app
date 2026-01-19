class AddAvatarLogoToProfiles < ActiveRecord::Migration[8.1]
  def change
    add_column :profiles, :avatar_logo, :json
  end
end
