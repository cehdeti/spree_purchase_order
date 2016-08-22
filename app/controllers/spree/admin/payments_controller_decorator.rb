Spree::Admin::PaymentsController.class_eval do

  Spree::PermittedAttributes.payment_attributes << :po_number

  def update

    puts "update payment!! #{Spree::PermittedAttributes.payment_attributes}"

    invoke_callbacks(:update, :before)

    params.require(:payment).permit(:po_image)

    begin
      puts "begin!!!"
      @payment[:po_number] = params[:payment][:po_number]
      if !params[:payment][:po_image].nil?
        @payment.po_image = params[:payment][:po_image]
      end

      if @payment.save
        puts "HHHH"
        puts "DID SAVE! #{@payment}, #{@payment.po_number}, #{@payment.payment_method}"
        invoke_callbacks(:update,:after)
        # Transition order as far as it will go.
        while @order.next; end
        # If "@order.next" didn't trigger payment processing already (e.g. if the order was
        # already complete) then trigger it manually now
        puts "HELLO!!!"
        puts "PAYMENT::::: AFTER: #{@payment} #{@payment.po_number}"
        puts "IMAGE:+ #{@payment.po_image}"
        @payment.process! if @order.completed? && @payment.checkout?

        flash[:success] = flash_message_for(@payment, :successfully_created)
#        redirect_to update_admin_order_payment_path (@payment)

      else
        puts "EEEEEE"
        invoke_callbacks(:update, :fails)
        puts "DDDDD"

        flash[:error] = Spree.t(:payment_could_not_be_created)
#        render :new
      end
    rescue Spree::Core::GatewayError => e
      puts "SPREE CORE GATEWAY ERROR: #{e} with message: #{e.message}"
      invoke_callbacks(:update, :fails)
      flash[:error] = "#{e.message}"
#      redirect_to admin_order_payments_path(@order)
    end


  end

end
