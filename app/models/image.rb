class Image < ApplicationRecord

	has_attached_file :content, styles: { large: "1500x900#", thumb: "750x450#" }
	validates_attachment_content_type :content, content_type: /^image\/(jpg|jpeg|pjpeg|png|x-png|gif)$/

  	belongs_to :collection
end
