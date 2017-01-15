class BookingTemplatesController < ApplicationController
  before_action :set_booking_template, only: [:show, :edit, :update, :destroy]

  # GET /booking_templates
  # GET /booking_templates.json
  def index
    @booking_templates = BookingTemplate.all
  end

  # GET /booking_templates/1
  # GET /booking_templates/1.json
  def show
  end

  # GET /booking_templates/new
  def new
    @booking_template = BookingTemplate.new
  end

  # GET /booking_templates/1/edit
  def edit
  end

  # POST /booking_templates
  # POST /booking_templates.json
  def create
    @booking_template = BookingTemplate.new(booking_template_params)

    respond_to do |format|
      if @booking_template.save
        format.html { redirect_to @booking_template, notice: 'Booking template was successfully created.' }
        format.json { render :show, status: :created, location: @booking_template }
      else
        format.html { render :new }
        format.json { render json: @booking_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /booking_templates/1
  # PATCH/PUT /booking_templates/1.json
  def update
    respond_to do |format|
      if @booking_template.update(booking_template_params)
        format.html { redirect_to @booking_template, notice: 'Booking template was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking_template }
      else
        format.html { render :edit }
        format.json { render json: @booking_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /booking_templates/1
  # DELETE /booking_templates/1.json
  def destroy
    @booking_template.destroy
    respond_to do |format|
      format.html { redirect_to booking_templates_url, notice: 'Booking template was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking_template
      @booking_template = BookingTemplate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_template_params
      params.require(:booking_template).permit(:name, :creator, :created_at)
    end
end
