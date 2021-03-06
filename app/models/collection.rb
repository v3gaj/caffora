class Collection < ApplicationRecord

	has_attached_file :cover, styles: { thumb: "686x464#", large: "1920x1280#"}
	validates_attachment_content_type :cover, content_type: /^image\/(jpg|jpeg|pjpeg|png|x-png|gif)$/

	validates_uniqueness_of :post_id, allow_nil: :true
	validates :title, :presence => true
	validates :subtitle, :presence => true
	validates :cover_file_name, :presence => true

	has_many :images, dependent: :destroy
  	belongs_to :post, optional: true
end
