class OrderMailer < ActionMailer::Base
  default from: "no-reply@myshirtfund.com"

  def new_order(order)
    @order = order
    mail(to: @order.user.email, subject: 'Order Created!')
  end
end