class ErrorsController < ApplicationController
  def handle_root_not_found
    render json: { :success => false, message: "Routes not found" }, status: 404
  end
end
