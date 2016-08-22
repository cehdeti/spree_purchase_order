class AddPoImageToSpreePayments < ActiveRecord::Migration
  def up
    add_attachment :spree_payments, :po_image
  end

  def down
    remove_attachment :spree_payments, :po_image
  end
end
