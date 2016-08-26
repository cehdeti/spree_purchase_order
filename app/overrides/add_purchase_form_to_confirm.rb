Deface::Override.new(
    virtual_path: 'spree/checkout/_confirm',
    name: 'add_purchase_form_to_confirm',
    insert_before: "[data-hook='buttons']",
    text: <<-TEXT
    <%= render partial:'spree/checkout/payment/purchase_order_form', locals: {
      order: @order,
      payment: @order.payments.valid.first,
      f: form
    } %>
TEXT
)
