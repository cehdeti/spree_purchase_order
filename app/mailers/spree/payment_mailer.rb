module Spree
  class PaymentMailer < BaseMailer

    def payment_complete_email(order)
      @order = order.respond_to?(:id) ? order : Spree::Order.find(order)
      @subscription = Spree::AccountSubscription.find_by(order:order)
      @payment = @order.payments.valid.first
      @completed = true

      subject = "#{Spree::Store.current.name} #{Spree.t('order_mailer.confirm_email.subject')} ##{@order.number}"
      mail(to: @order.email, from: from_address, subject: subject) do |format|
        format.text
        format.html
      end
    end
  end


end