class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy start contact graduation complete]

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @goals = Goal.all
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params.merge(status: :contact))

    respond_to do |format|
      if @user.save
        format.html { redirect_to contact_user_path(@user) }
      else
        @goals = Goal.all
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def start
    @goals = Goal.all
  end

  def contact
  end

  def graduation
    @degrees = Degree.all
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to next_step }
      else
        format.html { render current_step, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.fetch(:user, {}).permit(:goal_id,
                                     :first_name,
                                     :last_name,
                                     :email,
                                     :phone_number,
                                     :status,
                                     graduation_attributes: [:id, :degree_id, :year])
    end

    def next_step
      case @user.status
      when 'start'
        start_user_path(@user)
      when 'contact'
        contact_user_path(@user)
      when 'graduation'
        graduation_user_path(@user)
      when 'complete'
        complete_user_path(@user)
      end
    end

    def current_step
      case @user.status
      when 'start'
        @goals = Goal.all
        :start
      when 'contact'
        :start
      when 'graduation'
        :contact
      when 'complete'
        @degrees = Degree.all
        :graduation
      end

    end
end
