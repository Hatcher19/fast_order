class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]


  def index
    @orders = Order.all
  end

  def show
  end

  def new
    @order = current_user.orders.build
  end

  def edit
  end

  def create
    @order = current_user.orders.build(order_params)
    if @order.save
      redirect_to @order, notice: 'You are almost done!'
    else
      render :new
    end
  end

  def update
    if @order.update(order_params)
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

    def correct_user
      @order = current_user.orders.find_by(id: params[:id])
      redirect_to orders_path, notice: "Not authorized to edit this order" if @order.nil?
    end

    def order_params
      params.require(:order).permit(:status, :date, :user_id, :tracking, :ship_vendor, line_items_attributes: [:id, :league, :team, :division, :shirtcolor, :inkcolor, :shirtsize, :quantity, :order_id])
    end
end