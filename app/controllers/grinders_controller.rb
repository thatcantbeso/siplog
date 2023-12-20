class GrindersController < ApplicationController
  before_action :set_grinder, only: %i[ show edit update destroy ]
  after_action :verify_policy_scoped, only: %i[index]
  before_action {authorize (@grinder || Grinder) }

  def index
    @grinders = policy_scope(Grinder)
    verify_policy_scoped
  end


  def show
    @grinder = Grinder.find(params[:id])
    authorize @grinder
  end

  def set_user
    @user = current_user
  end


  def new
    @grinder = Grinder.new
    authorize @grinder
  end


  def edit
    authorize @grinder
  end


  def create
    @grinder = Grinder.new(grinder_params)

    respond_to do |format|
      if @grinder.save
        format.html { redirect_to grinders_path, notice: "Grinder was successfully created." }
        format.json { render :show, status: :created, location: @grinder }

      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @grinder.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @grinder.update(grinder_params)
        format.html { redirect_to grinders_path, notice: "Grinder was successfully updated." }
        format.json { render :show, status: :ok, location: @grinder }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @grinder.errors, status: :unprocessable_entity }
      end
    end
  end


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

  private

  def set_grinder
    @grinder = Grinder.find(params[:id])
  end


  def grinder_params
    params.require(:grinder).permit(:owner_id, :brand, :name, :power, :burr_type, :burr)
  end
end
