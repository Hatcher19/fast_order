# Preview all emails at http://localhost:3000/rails/mailers/order_mailer
class OrderMailerPreview < ActionMailer::Preview
  def order_mailer_preview
    OrderMailer.new_order(Order.first)
  end
end
