class GearsController < OpenReadController
  before_action :set_gear, only: [:show, :update, :destroy]

  # GET /gears
  def index
    @gears = Gear.all

    render json: @gears
  end

  # GET /gears/1
  def show
    render json: @gear
  end

  # POST /gears
  def create
    @gear = current_user.gears.build(gear_params)

    if @gear.save
      render json: @gear, status: :created, location: @gear
    else
      render json: @gear.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /gears/1
  def update
    if @gear.update(gear_params)
      render json: @gear
    else
      render json: @gear.errors, status: :unprocessable_entity
    end
  end

  # DELETE /gears/1
  def destroy
    @gear.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gear
      @gear = Gear.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def gear_params
      params.require(:gear).permit(:title, :description, :price, :availability, :image_URL)
    end
end
