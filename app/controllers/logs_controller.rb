class LogsController < ApplicationController
  before_action :set_log, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: :landing
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # after_action :verify_authorized, except: %i[index]
  after_action :verify_policy_scoped, only: %i[index]

  # GET /logs or /logs.json
  def index
    # @user = User.find_by!(id: params.fetch(:id))
    @logs = Log.all
  end

  # GET /logs/1 or /logs/1.json
  def show
  end

  # GET /logs/new
  def new
    @log = Log.new
  end

  # GET /logs/1/edit
  def edit
  end

  # POST /logs or /logs.json
  def create
    @log = Log.new(log_params)

    respond_to do |format|
      if @log.save
        format.html { redirect_to log_url(@log), notice: "Log was successfully created." }
        format.json { render :show, status: :created, location: @log }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /logs/1 or /logs/1.json
  def update
    respond_to do |format|
      if @log.update(log_params)
        format.html { redirect_to log_url(@log), notice: "Log was successfully updated." }
        format.json { render :show, status: :ok, location: @log }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /logs/1 or /logs/1.json
  def destroy
    if current_user == @log.owner
      @log.destroy

      respond_to do |format|
        format.html { redirect_to logs_url, notice: "Log was successfully destroyed." }
        format.json { head :no_content }
      end
    else
      redirect_back(fallback_location: root_url, notice: "Not your log.")
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_log
    @log = Log.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def log_params
    params.require(:log).permit(:owner_id, :coffee_id, :grinder_id, :brewer_id, :notes, :filter_paper, :dosage, :water_temperature, :water_type, :photo, :grind_size, :bloom_time_seconds, :brew_time_seconds, :bloom_water, :total_water, :date_time, :rating, :favorite)
  end

  def user_not_authorized
    flash[:alert] = "You are not authorized."
    redirect_to(request.referer || root_path)
  end
end
