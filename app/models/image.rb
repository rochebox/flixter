class Image < ActiveRecord::Base
	#belongs_to :user
	belongs_to :course

	mount_uploader :imageupload, ImageuploadUploader
end
