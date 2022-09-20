class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def candidat
    @user = current_user
    @post = Post.all
  end

  def profile
    @user = current_user
  end

  private

  def params_create
    params.require('/candidat').permit(:id, :email, :nom, :prenom, :adresse, :telephone, :date_de_naissance, :sexe, :infos, :role, :avatar, :photo)
  end

  def set_profile
    @user = User.find(params[:id])
  end
end
