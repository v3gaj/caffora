class Image < ApplicationRecord

	has_attached_file :content, styles: { large: "1500x1000#", thumb: "750x500#" }
	validates_attachment_content_type :content, content_type: /^image\/(jpg|jpeg|pjpeg|png|x-png|gif)$/

  	belongs_to :collection
end
