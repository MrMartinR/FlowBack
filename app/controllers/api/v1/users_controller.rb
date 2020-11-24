class Api::V1::UsersController < Api::BaseController
  before_action :authenticate_api_v1_user!
  before_action :auth_admin!, only: [:index]
  before_action :find_user, only: [:show, :update, :destroy]

  def index
    @page = params[:page] || 1
    @total_pages = User.paginate(page: params[:page],per_page: params[:per_page]).total_pages
    @users = User.order('username asc').paginate(page: params[:page],per_page: params[:per_page])
  end

  def show
    @user = current_api_v1_user if !current_api_v1_user.has_role?(:admin)
  end

  def user_profile
    @user = current_api_v1_user
  end

  def update
    if current_api_v1_user == @user || current_api_v1_user.has_role?(:admin)
      if @user.update!(user_params)
        render json: show
      else
        render json: {success: false,status: 400, message: "Could not update profile"}
      end
    else
      render json: {success: false, code: 403, message: "Forbidden"}
    end
  end

  def update_profile
    @user = current_api_v1_user

    if @user.update(user_params)
      @user.update_column(:country_id, user_params[:country_id]) if user_params[:country_id].present?
      @user.update_column(:currency_id, user_params[:currency_id]) if user_params[:currency_id].present?
      render :user_profile, status: :ok
    else
      render json: {success: false, status: 400, message: "#{@user.errors.full_messages.join(',')}"}
    end
  end

  def destroy
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

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require("user").permit(:uid, :username, :email,  "password", :password_confirmation, :current_password,:currency_id, :country_id, :avatar, :dob, :name, :surname)
  end

  rescue_from ActionController::UnpermittedParameters do |error|
    message = "Invalid parameter: %s. " % error.params.to_sentence
    message << 'Please verify that the parameter name is valid and the values are the correct type.'
    render_error 'param_error', :status => :bad_request, :locals => { :exception => error, :message => message }
  end
end