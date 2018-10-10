class OrderMailer < ActionMailer::Base
  default from: "no-reply@orderex.herokuapp.com"

  def new_order(order)
    @order = order
    mail(to: @order.user.email, subject: 'Order Created!')
  end
end