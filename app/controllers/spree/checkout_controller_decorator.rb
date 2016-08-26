Spree::CheckoutController.class_eval do

  Spree::PermittedAttributes.payment_attributes << :po_number
  Spree::PermittedAttributes.payment_attributes << :po_image

end