class Users::BuildController < ApplicationController
  include Wicked::Wizard

  steps :contact, :education, :complete

  before_action :fetch_user

  def show
    render_wizard
  end

  def update
    params[:user][:status] = step.to_s
    params[:user][:status] = 'complete' if step == steps.last
    @user.update(user_params)
    render_wizard @user
  end

  private

  def fetch_user
    @user = User.find(params[:user_id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :phone_number, :status)
  end

end