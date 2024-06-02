class UsersController < ApplicationController
  def new
  end

  def create
    if User.find_by({ "username" => params["username"] }) == nil
      @user = User.new
      @user["email"] = params["email"]
      @user["password"] = BCrypt::Password.create(params["password"])
      @user.save
      redirect_to "/"
    else
    flash["notice"] = "Username taken."
    redirect_to "/users/new"
    end
  end
end
