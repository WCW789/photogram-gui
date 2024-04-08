class UsersController < ApplicationController
  def create
    @user = User.new
    @user.username = params.fetch("input_username")

    if @user.valid?
      @user.save
      redirect_to("/users/#{@user.username}", { :notice => "Username created successfully." })
    else
      redirect_to("/users/#{@user.username}", { :notice => "Username failed to create successfully." })
    end
  end

  def show
    the_username = params.fetch("path_id")
    @user_information = User.where({ :username => the_username })
    @user = @user_information.at(0)

    render({ :template => "users_template/users" })
  end

  def update
    the_id = params.fetch("path_id")
    @user = User.where({ :id => the_id }).at(0)

    @user.username = params.fetch("new_username")

    if @user.valid?
      @user.save
      redirect_to("/users/#{@user.username}", { :notice => "Username updated successfully."} )
    else
      redirect_to("/users/#{@user.username}", { :alert => "Username failed to update successfully." })
    end
  end
end
