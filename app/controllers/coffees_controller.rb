class CoffeesController < ApplicationController
  before_action :set_coffee, only: %i[ show edit update destroy ]
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  after_action :verify_policy_scoped, only: %i[index]
  before_action {authorize (@coffee || Coffee) }

  def index
    @coffees = policy_scope(Coffee)
    verify_policy_scoped
    @coffees = Coffee.where(owner: current_user).order(created_at: :desc)
  end

  def show
    @coffee = Coffee.find(params[:id])
    authorize @coffee
  end

  def set_user
    @user = current_user
  end

  def new
    @coffee = Coffee.new
  end

  def edit
  end

  def create
    @coffee = Coffee.new(coffee_params)

    respond_to do |format|
      if @coffee.save
        format.html { redirect_to coffees_path, notice: "Coffee was successfully created." }
        format.json { render :show, status: :created, location: @coffee }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @coffee.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @coffee.update(coffee_params)
        format.html { redirect_to coffees_path, notice: "Coffee was successfully updated." }
        format.json { render :show, status: :ok, location: @coffee }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @coffee.errors, status: :unprocessable_entity }
      end
    end
  end

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

  def set_coffee
    @coffee = Coffee.find(params[:id])
  end

  def coffee_params
    params.require(:coffee).permit(:owner_id, :species, :varietal, :process, :elevation, :region, :subregion, :roast_level, :roast_date, :cup_score, :tasting_notes, :name, :roaster, :producer, :favorite, :notes)
  end
end
