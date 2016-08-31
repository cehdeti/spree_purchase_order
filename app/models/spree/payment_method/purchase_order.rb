module Spree
  class PaymentMethod::PurchaseOrder < PaymentMethod
  	def payment_source_class
      ::Spree::PurchaseOrder
    end

    def actions
      %w{capture void}
    end

    # Indicates whether its possible to capture the payment
    def can_capture?(payment)

      if !payment.po_number || !payment.po_image
        return false
      end

      ['checkout', 'pending'].include?(payment.state)

    end

    # Indicates whether its possible to void the payment.
    def can_void?(payment)
      payment.state != 'void'
    end

    def capture(*)
      simulated_successful_billing_response
    end

    def cancel(*)
      simulated_successful_billing_response
    end

    def void(*)
      simulated_successful_billing_response
    end

    def source_required?
      false
    end

    def credit(*)
      simulated_successful_billing_response
    end

    private

    def simulated_successful_billing_response
      ActiveMerchant::Billing::Response.new(true, "", {}, {})
    end



  end
end
