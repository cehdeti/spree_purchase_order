Spree::Payment.class_eval do

	has_attached_file :po_image

	validates_attachment_file_name :po_image, :matches => [/png\Z/, /jpe?g\Z/, /gif\Z/, /pdf\Z/, /doc\Z/, /docx\Z/]

	validates_attachment :po_image, :content_type => {:content_type => %w(image/jpeg image/jpg image/png application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document)}


end