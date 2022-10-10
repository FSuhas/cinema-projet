class RecruteursController < ApplicationController
  before_action :set_profile, only: [:edit]

  def index
    @user = current_user
    @recruteurs = User.where(role: "recruteur")
  end


  def edit
  end

  def update
    @user = current_user
    if current_user.update(params_create)
      redirect_to profiles_path
      flash[:notice] = "Mis à jour avec succès"
    else
      alert[:notice] = "Une erreur est survenue"
    end
  end

  private

  def set_profile
    @user = User.find(params[:id])
  end

  def params_create
    params.require('/profiles').permit(:id, :email, :nom, :prenom, :adresse, :telephone, :date_de_naissance, :sexe, :infos, :role, :avatar, :photo)
  end
end
