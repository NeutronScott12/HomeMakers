class Item < ActiveRecord::Base

	has_many :products
	belongs_to :user

	has_attached_file :image, styles: { medium: "700x500#", small: "350x250>" }, default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/	

  	validates :title, :presence => true, :length => {:maximum => 25}
  	validates :image, :presence => true

end
