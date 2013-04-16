module Spree
  class PaymentMethod::PurchaseOrder < PaymentMethod
  	def payment_source_class
      PurchaseOrder
    end

    def actions
      %w{complete void}
    end

    # Indicates whether its possible to capture the payment
    def can_complete?(payment)
      ['checkout', 'pending'].include?(payment.state)
    end

    # Indicates whether its possible to void the payment.
    def can_void?(payment)
      payment.state != 'void'
    end

    # copied in from spree 1.1
    # https://github.com/fonemstr/spree/blob/169bd3d989e142b4f945ab4cd25eb946776c42ae/core/app/models/spree/payment_method/check.rb
    def complete(*args)
      ActiveMerchant::Billing::Response.new(true, "", {}, {})
    end

    # copied in from spree 1.1
    # https://github.com/fonemstr/spree/blob/169bd3d989e142b4f945ab4cd25eb946776c42ae/core/app/models/spree/payment_method/check.rb
    def void(*args)
      ActiveMerchant::Billing::Response.new(true, "", {}, {})
    end

    def source_required?
      false
    end
  end
end
