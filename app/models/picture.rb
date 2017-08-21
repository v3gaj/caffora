class Picture < ApplicationRecord

	has_attached_file :image, styles: { large: "1400x550#"}
	validates_attachment_content_type :image, content_type: /^image\/(jpg|jpeg|pjpeg|png|x-png|gif)$/

end
