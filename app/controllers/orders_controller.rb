class OrdersController < ApplicationController
  before_action :authenticate_user!, :except => [:show, :index]
  load_and_authorize_resource :only => [:new, :edit, :destroy]
   
  before_action :require_login
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def require_login
    unless current_user
      redirect_to new_user_session_path
    end
  end

  def index
    @orders = Order.all
  end

  def show
    @line_items = @order.line_items.group(:team, :shirtcolor, :inkcolor).sum(:shirt_quantity)
    @message = Message.new
  end

  def new
    @order = current_user.orders.build
  end

  def edit
  end

  def create
    @order = current_user.orders.build(order_params)
    if @order.save
      # Sends email to user when order is created. I may want to change this later to after line_items are created.
      OrderMailer.new_order(@order).deliver
      redirect_to @order, notice: 'Your order has been successfully submitted.'
    else
      render :new
    end
  end

  def update
    if @order.update(order_params)
      if @order.saved_change_to_attribute? :status, to: 'approved'
        OrderMailer.approved_status_order(@order).deliver
      elsif @order.saved_change_to_attribute? :status, to: 'printing'
        OrderMailer.printing_status_order(@order).deliver
      elsif @order.saved_change_to_attribute? :status, to: 'shipped'
        OrderMailer.shipped_status_order(@order).deliver
      end         
      redirect_to @order, notice: 'Order was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @order.destroy
    redirect_to orders_url
  end

  private
    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:status, :date, :entity, :user_id, :address_id, :tracking, :ship_vendor, :ship_cost, :spreadsheet_link, line_items_attributes: [:id, :league, :team, :division, :shirtcolor, :inkcolor, :shirtsize, :shirt_quantity, :order_id])
    end
end