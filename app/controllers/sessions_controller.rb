class SessionsController < ApplicationController
  def create
    user = User.find_by!(username: params[:username])
    session[:user_id] = user[:id]
    render json: user, status: :created
    puts session[:session_id]
  end

  def destroy
    if session[:user_id]
      session.delete(:user_id)
      head :no_content
    end
  end
end
