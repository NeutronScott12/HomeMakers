class Product < ActiveRecord::Base

	belongs_to :user
	belongs_to :item

	has_attached_file :image, styles: { medium: "700x500#", small: "350x250>" }, default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/	

  	validates :title, :presence => true, :length => {:maximum => 70}
  	validates :description, :presence => true
  	validates :price, :presence => true
  	validates :image, :presence => true

end
