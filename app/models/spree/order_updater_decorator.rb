Spree::OrderUpdater.class_eval do

  def check_payment_state_change( old_state )
    puts "CHECK PAYMENT STATE CHANGE: #{old_state}, #{order.payment_state}"
    if order.payment_state=='paid' and order.payment_state != old_state:
      puts "DO SEND CONFIRMATION EMAIL!!!"
    end
  end

  def update_payment_state_with_check_payment_state_change

    current_state = order.payment_state
    result = update_payment_state_without_check_payment_state_change
    check_payment_state_change current_state
    result
  end

  alias_method_chain :update_payment_state, :check_payment_state_change

end