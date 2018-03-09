class SessionsController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    #should create a new session and log the user in
    @user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
    )

    if @user
      log_in_user!(@user)
      redirect_to bands_url
    else
      flash.now[:errors] = ["The email or the password are not correct"]
      render :new
    end
  end

  def destroy
    log_out!
    redirect_to new_session_url
  end

end
