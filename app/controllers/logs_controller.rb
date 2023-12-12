class LogsController < ApplicationController
  before_action :set_log, only: %i[ edit update destroy ]
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  after_action :verify_authorized, except: %i[index]
  after_action :verify_policy_scoped, only: %i[index]
  before_action {authorize (@log || Log) }

  def index
    @user = current_user
    @logs = policy_scope(Log)
    verify_policy_scoped
    @logs = Log.all
    @log = Log.new
  end

  # def show
  #   @log = Log.find(params[:id])
  #   authorize @log
  # end

  def new
    @log = Log.new
    @log.date_time = Time.current
    authorize @log
  end

  def edit
    authorize @log
  end

  def create
    @log = Log.new(log_params)
    authorize @log
    respond_to do |format|
      if @log.save
        format.html { redirect_to logs_path, notice: "Log was successfully created." }
        format.json { render :index, status: :created, location: @log }
        format.js
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @log.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    authorize @log
    respond_to do |format|
      if @log.update(log_params)
        format.html { redirect_to log_url(@log), notice: "Log was successfully updated." }
        format.json { render :index, status: :ok, location: @log }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /logs/1 or /logs/1.json
  def destroy
    authorize @log
    if current_user == @log.owner
      @log.destroy
      respond_to do |format|
        format.html { redirect_to logs_url, notice: "Log was successfully destroyed." }
        format.json { head :no_content }
        format.js
      end
    else
      redirect_back(fallback_location: root_url, notice: "Not your log.")
    end
  end

  # def increase_range
  #   @log = Log.find(params[:id])
  #   @log.increment!(:rating)

  #   respond_to do |format|
  #     format.js
  #   end
  # end

  # def decrease_range
  #   @log = Log.find(params[:id])
  #   @log.decrement!(:rating)

  #   respond_to do |format|
  #     format.js
  #   end
  # end

  def set_log
    @log = Log.find(params[:id])
  end

  def set_user
    @user = current_user
  end

  def log_params
    params.require(:log).permit(:owner_id, :coffee_id, :grinder_id, :brewer_id, :notes, :filter_paper, :dosage, :water_temperature, :water_type, :photo, :grind_size, :bloom_time_seconds, :brew_time_seconds, :bloom_water, :total_water, :date_time, :rating, :favorite)
  end
end
