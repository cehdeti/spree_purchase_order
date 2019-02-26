Spree::Payment.class_eval do

  has_attached_file :po_image

  validates_attachment_file_name :po_image, :matches => [/png\Z/, /jpe?g\Z/, /gif\Z/, /pdf\Z/, /doc\Z/, /docx\Z/]

  validates_attachment :po_image, :content_type => {:content_type => %w(image/jpeg image/jpg image/png application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document)}

  state_machine initial: :checkout do
    after_transition to: :completed, do: :send_payment_email!
  end

  def send_payment_email!
    if order.payment_state == 'paid' && payment_method.type == 'Spree::PaymentMethod::PurchaseOrder'
      logger.debug 'sending payment email!'
      Spree::PaymentMailer.payment_complete_email(order).deliver_later
    end
  end
end
