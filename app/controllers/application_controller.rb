class ApplicationController < ActionController::API
  def index
    render json: {message: "successfull deployed test rails api to yeti cloud."}, status: :ok
  end
end
