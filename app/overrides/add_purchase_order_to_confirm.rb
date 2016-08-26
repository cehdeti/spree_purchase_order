Deface::Override.new(
  virtual_path: 'spree/shared/_order_details',
  name: 'add_purchase_order_to_confirm',
  replace_contents: "[data-hook='order-payment']",
  text: <<-TEXT
    <%= render partial:'spree/shared/confirm_po_details', locals: {
      order: @order
    } %>
  TEXT
)

