class Api::BaseController < ApplicationController
  include DeviseTokenAuth::Concerns::SetUserByToken
  include ExceptionHandler
  include Response

  before_action :set_var

  protected

  def set_var
    @user = current_api_v1_user
  end
end
