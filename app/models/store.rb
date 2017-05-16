class Store < ApplicationRecord
	has_and_belongs_to_many :users

	mount_uploader :thumb_image, StoreUploader
	mount_uploader :main_image, StoreUploader
end
