class ApplicationController < ActionController::API
  def index
    render json: {message: "working!"}, status: :ok
  end
end
