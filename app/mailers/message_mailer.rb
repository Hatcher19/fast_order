class MessageMailer < ActionMailer::Base
	default from: "orders@myshirtfund.com"

	def new_message(message)
	  @message = message
	  @order = @message.order
	  mail to: @message.order.user.email, cc: "orders@myshirtfund.com", subject: "You have a new message for Order ##{@message.order.id}"
	end
end