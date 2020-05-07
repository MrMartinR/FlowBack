class Api::V1::SettingsController < ApplicationController
  before_action :authenticate_api_v1_user!

  def index
    @user = current_api_v1_user
  end
end