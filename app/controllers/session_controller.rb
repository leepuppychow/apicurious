class SessionController < ApplicationController

  def create
    @user = User.from_omniauth(request.env["omniauth.auth"])
    session[:user_id] = @user.id
    redirect_to dashboard_index_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private

    def auth_hash
      request.env['omniauth.auth']
    end
end
