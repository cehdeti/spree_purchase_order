Spree::StateChange.class_eval do
  after_create :on_payment_completed, if: -> { stateful.is_a?(Spree::Order) && name == 'payment' && next_state == :paid }

  def on_payment_completed

    logger.debug "Transitioned to Paid" #not being called
  end
end
