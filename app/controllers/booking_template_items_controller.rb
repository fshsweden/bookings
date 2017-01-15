class BookingTemplateItemsController < ApplicationController
  before_action :set_booking_template_item, only: [:show, :edit, :update, :destroy]

  # GET /booking_template_items
  # GET /booking_template_items.json
  def index
    @booking_template_items = BookingTemplateItem.all
  end

  # GET /booking_template_items/1
  # GET /booking_template_items/1.json
  def show
  end

  # GET /booking_template_items/new
  def new
    @booking_template_item = BookingTemplateItem.new
  end

  # GET /booking_template_items/1/edit
  def edit
  end

  # POST /booking_template_items
  # POST /booking_template_items.json
  def create
    @booking_template_item = BookingTemplateItem.new(booking_template_item_params)

    respond_to do |format|
      if @booking_template_item.save
        format.html { redirect_to @booking_template_item, notice: 'Booking template item was successfully created.' }
        format.json { render :show, status: :created, location: @booking_template_item }
      else
        format.html { render :new }
        format.json { render json: @booking_template_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /booking_template_items/1
  # PATCH/PUT /booking_template_items/1.json
  def update
    respond_to do |format|
      if @booking_template_item.update(booking_template_item_params)
        format.html { redirect_to @booking_template_item, notice: 'Booking template item was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking_template_item }
      else
        format.html { render :edit }
        format.json { render json: @booking_template_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /booking_template_items/1
  # DELETE /booking_template_items/1.json
  def destroy
    @booking_template_item.destroy
    respond_to do |format|
      format.html { redirect_to booking_template_items_url, notice: 'Booking template item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking_template_item
      @booking_template_item = BookingTemplateItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_template_item_params
      params.require(:booking_template_item).permit(:booking_template_id, :date_str, :week, :from, :to, :activity, :team, :note, :zamboni, :comment)
    end
end
