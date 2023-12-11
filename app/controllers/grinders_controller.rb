class GrindersController < ApplicationController
  before_action :set_grinder, only: %i[ show edit update destroy ]
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  after_action :verify_policy_scoped, only: %i[index]
  # GET /grinders or /grinders.json
  def index
    @grinders = policy_scope(Grinder)
    verify_policy_scoped 
  end

  # GET /grinders/1 or /grinders/1.json
  def show
    @grinder = Grinder.find(params[:id])
    authorize @grinder
  end


  def set_user
    @user = current_user
  end

  # GET /grinders/new
  def new
    @grinder = Grinder.new
    authorize @grinder
  end

  # GET /grinders/1/edit
  def edit
    authorize @grinder
  end

  # POST /grinders or /grinders.json
  def create
    @grinder = Grinder.new(grinder_params)

    respond_to do |format|
      if @grinder.save
        format.html { redirect_to grinder_url(@grinder), notice: "Grinder was successfully created." }
        format.json { render :show, status: :created, location: @grinder }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @grinder.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /grinders/1 or /grinders/1.json
  def update
    respond_to do |format|
      if @grinder.update(grinder_params)
        format.html { redirect_to grinder_url(@grinder), notice: "Grinder was successfully updated." }
        format.json { render :show, status: :ok, location: @grinder }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @grinder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /grinders/1 or /grinders/1.json
  def destroy
    if current_user == @grinder.owner
      @grinder.destroy

      respond_to do |format|
        format.html { redirect_to grinders_url, notice: "Grinder was successfully destroyed." }
        format.json { head :no_content }
      end
    else
      redirect_back(fallback_location: root_url, notice: "Not your grinder.")
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_grinder
    @grinder = Grinder.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def grinder_params
    params.require(:grinder).permit(:owner_id, :brand, :name, :power, :burr_type, :burr)
  end
end
