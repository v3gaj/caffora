class Slider < ApplicationRecord

	has_attached_file :image, styles: { large: "1920x900#", thumb: "336x123#" }
	validates_attachment_content_type :image, content_type: /^image\/(jpg|jpeg|pjpeg|png|x-png|gif)$/

	default_scope { order(index: :asc) }

	validates_uniqueness_of :index

	validates :title, presence: true

	validates :subtitle, presence: true

end
