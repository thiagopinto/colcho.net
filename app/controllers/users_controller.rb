class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, notice: 'Cadastro criado com sucesso!'
    elsif
      render action: :new
    end
  end

  def user_params
    params.require(:user).permit(:full_name, :email, :location, :password, :password_confirmation, :bio)
  end
end
