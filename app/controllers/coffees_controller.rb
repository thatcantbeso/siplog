class CoffeesController < ApplicationController
  before_action :set_coffee, only: %i[ show edit update destroy ]
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  after_action :verify_policy_scoped, only: %i[index]
  # GET /coffees or /coffees.json
  def index
    @coffees = policy_scope(Coffee)
    verify_policy_scoped
  end

  # GET /coffees/1 or /coffees/1.json
  def show
    @coffee = Coffee.find(params[:id])
    authorize @coffee
  end

  private

  def set_user
    @user = current_user
  end

  # GET /coffees/new
  def new
    @coffee = Coffee.new
  end

  # GET /coffees/1/edit
  def edit
  end

  # POST /coffees or /coffees.json
  def create
    @coffee = Coffee.new(coffee_params)

    respond_to do |format|
      if @coffee.save
        format.html { redirect_to coffee_url(@coffee), notice: "Coffee was successfully created." }
        format.json { render :show, status: :created, location: @coffee }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @coffee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /coffees/1 or /coffees/1.json
  def update
    respond_to do |format|
      if @coffee.update(coffee_params)
        format.html { redirect_to coffee_url(@coffee), notice: "Coffee was successfully updated." }
        format.json { render :show, status: :ok, location: @coffee }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @coffee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coffees/1 or /coffees/1.json
  def destroy
    if current_user == @coffee.owner
      @coffee.destroy

      respond_to do |format|
        format.html { redirect_to coffees_url, notice: "Coffee was successfully destroyed." }
        format.json { head :no_content }
      end
    else
      redirect_back(fallback_location: root_url, notice: "Not your coffee.")
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_coffee
    @coffee = Coffee.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def coffee_params
    params.require(:coffee).permit(:owner_id, :species, :varietal, :process, :elevation, :region, :subregion, :roast_level, :roast_date, :cup_score, :tasting_notes, :name, :roaster, :producer, :favorite, :notes)
  end
end
