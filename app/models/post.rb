class Post < ApplicationRecord

	has_attached_file :cover, styles: { thumb: "370x250#", large: "1500x400#" }
	validates_attachment_content_type :cover, content_type: /^image\/(jpg|jpeg|pjpeg|png|x-png|gif)$/

	has_many :contents
	accepts_nested_attributes_for :contents

	validates :title, :presence => true
	validates :subtitle, :presence => true
	validates :release_date, :presence => true
	validates :cover_file_name, :presence => true
	validates :author, :presence => true
	
end
