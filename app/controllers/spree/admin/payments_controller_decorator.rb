Spree::Admin::PaymentsController.class_eval do
  Spree::PermittedAttributes.payment_attributes << :po_number

  def update
    invoke_callbacks(:update, :before)

    params.require(:payment).permit(:po_image)

    begin
      @payment.po_number = params[:payment][:po_number]
      @payment.po_image = params[:payment][:po_image] if params[:payment][:po_image].present?

      if @payment.save
        invoke_callbacks(:update, :after)
        # Transition order as far as it will go.
        while @order.next; end
        # If "@order.next" didn't trigger payment processing already (e.g. if
        # the order was already complete) then trigger it manually now.
        @payment.process! if @order.completed? && @payment.checkout?
        flash[:success] = flash_message_for(@payment, :successfully_created)
      else
        invoke_callbacks(:update, :fails)
        flash[:error] = Spree.t(:payment_could_not_be_created)
      end
    rescue Spree::Core::GatewayError => e
      invoke_callbacks(:update, :fails)
      flash[:error] = e.message.to_s
    end
  end
end
