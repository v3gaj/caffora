class Content < ApplicationRecord

	has_attached_file :image, styles: { thumb: "370x250#", large: "1200x500#" }
	validates_attachment_content_type :image, content_type: /^image\/(jpg|jpeg|pjpeg|png|x-png|gif)$/

	default_scope { order(index: :asc) }
	
	validates :index, uniqueness: { scope: :post_id }
	
	belongs_to :post

end
