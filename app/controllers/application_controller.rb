class ApplicationController < ActionController::API
  def index
    render json: {message: "working! deployed test rails api to yeti cloud."}, status: :ok
  end
end
