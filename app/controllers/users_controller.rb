class UsersController < ApplicationController
  def signup
  	@user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Cadastro realizado com sucesso! Para criar um novo caso, selecione Consuloria acima."
      redirect_to @user
    else
      render 'signup'
    end
  end

  private

	def user_params
	  params.require(:user).permit(:name, :email, :cpf, :allergy, :allergyDescription, :cancer, :cancerDescription, :surgery, :surgeryDescription, :password, :password_confirmation)
	end
end
