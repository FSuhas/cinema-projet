class RecruteursController < ApplicationController
  before_action :set_profile, only: [:edit]
  before_action :set_role, only: %i[index]

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

  def set_role
    if current_user.role == "candidat"
      redirect_to profiles_path
    end
  end

  def set_profile
    @user = User.find(params[:id])
  end

  def params_create
    params.require('/profiles').permit(:id, :email, :nom, :prenom, :departement, :telephone, :date_de_naissance, :sexe, :infos, :role, :avatar, :photo)
  end
end
