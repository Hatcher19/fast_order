class LineItemsController < ApplicationController
  before_action :set_line_item, only: [:show, :edit, :update, :destroy]

  # GET /line_items
  # GET /line_items.json
  def index
    @line_items = LineItem.all
    @sum = @line_items.sum(:shirt_quantity).to_f
    @black_sum = @line_items.where(shirtcolor: '001 BLACK').sum(:shirt_quantity).to_f
    @true_sum = @line_items.where(shirtcolor: '025 HTH GRAY').sum(:shirt_quantity).to_f
    @carbon_sum = @line_items.where(shirtcolor: '090 CARB GRAY').sum(:shirt_quantity).to_f
    @white_sum = @line_items.where(shirtcolor: '100 WHITE').sum(:shirt_quantity).to_f
    @green_sum = @line_items.where(shirtcolor: '301 DK GREEN').sum(:shirt_quantity).to_f
    @royal_sum = @line_items.where(shirtcolor: '400 ROYAL').sum(:shirt_quantity).to_f
    @navy_sum = @line_items.where(shirtcolor: '410 NAVY').sum(:shirt_quantity).to_f
    @carolina_sum = @line_items.where(shirtcolor: '475 CAR BLUE').sum(:shirt_quantity).to_f
    @purple_sum = @line_items.where(shirtcolor: '500 PURPLE').sum(:shirt_quantity).to_f
    @red_sum = @line_items.where(shirtcolor: '600 RED').sum(:shirt_quantity).to_f
    @maroon_sum = @line_items.where(shirtcolor: '609 MAROON').sum(:shirt_quantity).to_f
    @yellow_sum = @line_items.where(shirtcolor: '731 HI VIS YELLOW').sum(:shirt_quantity).to_f
    @steel_town_sum = @line_items.where(shirtcolor: '750 STEEL TOWN GOLD').sum(:shirt_quantity).to_f
    @orange_sum = @line_items.where(shirtcolor: '860 DK ORANGE').sum(:shirt_quantity).to_f
    @ys_sum = @line_items.where(shirtsize: 'YS').sum(:shirt_quantity).to_f
    @ym_sum = @line_items.where(shirtsize: 'YM').sum(:shirt_quantity).to_f
    @yl_sum = @line_items.where(shirtsize: 'YL').sum(:shirt_quantity).to_f
    @yxl_sum = @line_items.where(shirtsize: 'YXL').sum(:shirt_quantity).to_f
    @s_sum = @line_items.where(shirtsize: 'S').sum(:shirt_quantity).to_f
    @m_sum = @line_items.where(shirtsize: 'M').sum(:shirt_quantity).to_f
    @l_sum = @line_items.where(shirtsize: 'L').sum(:shirt_quantity).to_f
    @xl_sum = @line_items.where(shirtsize: 'XL').sum(:shirt_quantity).to_f
    @xxl_sum = @line_items.where(shirtsize: 'XXL').sum(:shirt_quantity).to_f
    @xxxl_sum = @line_items.where(shirtsize: 'XXXL').sum(:shirt_quantity).to_f
    @xxxxl_sum = @line_items.where(shirtsize: 'XXXXL').sum(:shirt_quantity).to_f
  end

  # GET /line_items/1
  # GET /line_items/1.json
  def show
  end

  # GET /line_items/new
  def new
    @line_item = LineItem.new
  end

  def import
    order = Order.find(params[:order_id])
    LineItem.import(params[:file], order)
    redirect_to order_path(order), notice: "Spreadsheet was successfully imported."
  end
  
  def edit
  end

  def create
    @line_item = LineItem.new(line_item_params, :order_id => :order_id)

    respond_to do |format|
      if @line_item.save
        format.html { redirect_to @line_item, notice: 'Line item was successfully created.' }
        format.json { render :show, status: :created, location: @line_item }
      else
        format.html { render :new }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /line_items/1
  # PATCH/PUT /line_items/1.json
  def update
    respond_to do |format|
      if @line_item.update(line_item_params)
        format.html { redirect_to @line_item, notice: 'Line item was successfully updated.' }
        format.json { render :show, status: :ok, location: @line_item }
      else
        format.html { render :edit }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_items/1
  # DELETE /line_items/1.json
  def destroy
    @line_item.destroy
    respond_to do |format|
      format.html { redirect_to @line_item.order, notice: 'Line item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def line_item_params
      params.require(:line_item).permit(:league, :team, :division, :shirtcolor, :inkcolor, :shirtsize, :shirt_quantity, :order_id, :file)
    end
end
