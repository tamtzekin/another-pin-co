class OrderMailer < ApplicationMailer

  def receipt(order)
    # Allows you to use @order in our Views
    @order = order

    mail to: @order.email, subject: "Thank you for supporting Another Pin Co"
  end
end
