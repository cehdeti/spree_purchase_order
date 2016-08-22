Spree::Payment.class_eval do

	has_attached_file :po_image

	has_attached_file :po_image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"

	validates_attachment_content_type :po_image, content_type: /\Aimage\/.*\z/


end