Deface::Override.new(
    virtual_path: 'spree/orders/show',
    name: 'add_purchase_form_to_confirm',
    insert_before: "[data-hook='links']",
    text: <<-TEXT
    <%= render partial:'spree/checkout/payment/purchase_order_summary', locals: {
      order: @order,
      payment: @order.payments.valid.first,
    } %>
TEXT
)
