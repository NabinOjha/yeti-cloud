class ApplicationController < ActionController::API
  def index
    render json: {message: "successfully deployed test rails api to yeti cloud."}, status: :ok
  end
end
