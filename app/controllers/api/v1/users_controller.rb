class Api::V1::UsersController < ApplicationController
  before_action :authenticate_api_v1_user!
#  before_action :auth_admin!, only: [:index]

  def index
    @page = params[:page] || 1
    @total_pages = User.paginate(page: params[:page]).total_pages
    @users = User.order('username asc').paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    puts @user.id
    puts current_api_v1_user.id
    puts current_api_v1_user == @user
    if current_api_v1_user == @user || current_api_v1_user.has_role?(:admin)
      if @user.update(user_params)
        render json: show
      else
        render json: {success: false,status: 400, message: "Could not update profile"}
      end
    else
      render json: {success: false, code: 403, message: "Forbidden"}
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
  end

  def create
    @user = current_api_v1_user
    if @user.update(user_params)
      render json: index
    else
      render json: {status: 400, message: "Could not update profile"}
    end
  end

  private

  def user_params
    params.require(:user).permit(:uid, :username, :email,  :password, :password_confirmation, :current_password,:currency_id, :country_id)
  end

  rescue_from ActionController::UnpermittedParameters do |error|
    message = "Invalid parameter: %s. " % error.params.to_sentence
    message << 'Please verify that the parameter name is valid and the values are the correct type.'
    render_error 'param_error', :status => :bad_request, :locals => { :exception => error, :message => message }
  end
end