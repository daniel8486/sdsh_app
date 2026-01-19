class Profile < ApplicationRecord
  mount_uploader :avatar_logo, AvatarLogoUploader
end
