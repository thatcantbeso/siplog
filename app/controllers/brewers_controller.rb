class BrewersController < ApplicationController
  before_action :set_brewer, only: %i[ show edit update destroy ]
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  after_action :verify_policy_scoped, only: %i[index]
  # GET /brewers or /brewers.json
  def index
    @brewers = policy_scope(Brewer)
    verify_policy_scoped
  end

  # GET /brewers/1 or /brewers/1.json
  def show
    @brewer = Brewer.find(params[:id])
    authorize @brewer
  end

  def set_user
    @user = current_user
  end

  # GET /brewers/new
  def new
    @brewer = Brewer.new
  end

  # GET /brewers/1/edit
  def edit
  end

  # POST /brewers or /brewers.json
  def create
    @brewer = Brewer.new(brewer_params)

    respond_to do |format|
      if @brewer.save
        format.html { redirect_to brewer_url(@brewer), notice: "Brewer was successfully created." }
        format.json { render :show, status: :created, location: @brewer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @brewer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /brewers/1 or /brewers/1.json
  def update
    respond_to do |format|
      if @brewer.update(brewer_params)
        format.html { redirect_to brewer_url(@brewer), notice: "Brewer was successfully updated." }
        format.json { render :show, status: :ok, location: @brewer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @brewer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /brewers/1 or /brewers/1.json
  def destroy
    if current_user == @brewer.owner
      @brewer.destroy

      respond_to do |format|
        format.html { redirect_to brewers_url, notice: "Brewer was successfully destroyed." }
        format.json { head :no_content }
      end
    else
      redirect_back(fallback_location: root_url, notice: "Not your brewer.")
    end
  end


  # Use callbacks to share common setup or constraints between actions.
  def set_brewer
    @brewer = Brewer.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def brewer_params
    params.require(:brewer).permit(:owner_id, :brand, :name, :material, :geometry)
  end
end
