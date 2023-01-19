class ApplicationController < ActionController::API
  def index
    render json: {message: "Now this is perfect bro. deployed test rails api to yeti cloud."}, status: :ok
  end
end
