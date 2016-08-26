Spree::CheckoutController.class_eval do

  puts "CHECKOUT CONTROLLER!!!!!!!!!!"
  Spree::PermittedAttributes.payment_attributes << :po_number
  Spree::PermittedAttributes.payment_attributes << :po_image
  puts "SPREE PERMITTED PAYMENT ATTRIBUTES: #{ Spree::PermittedAttributes.payment_attributes}"

end