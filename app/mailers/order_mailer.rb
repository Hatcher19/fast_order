class OrderMailer < ActionMailer::Base
	default from: "orders@myshirtfund.com"

	def new_order(order)
	  @order = order
	  mail to: @order.user.email, subject: "FAST ORDER | Order ##{@order.id} created."
	end

	def approved_status_order(order)
	  @order = order
	  mail to: @order.user.email, subject: "FAST ORDER | Order ##{@order.id} is approved and awaiting product."
	end

	def printing_status_order(order)
	  @order = order
	  mail to: @order.user.email, subject: "FAST ORDER | Order ##{@order.id} product has been received."
	end

	def shipped_status_order(order)
	  @order = order
	  mail to: @order.user.email, subject: "FAST ORDER | Order ##{@order.id} has shipped."
	end
end