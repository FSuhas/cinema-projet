class ProfilesController < ApplicationController
  before_action :set_profile, only: [:edit, :show,]
  before_action :set_profil, only: [:show]

  def index
    @user = current_user
    @candidats = User.where(role: "candidat")
    @booking = Booking.where(confirmation: false).first
  end

  def show
    @profile = User.find(params[:id])
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

  def set_profil
    if current_user.role == "candidat"
      redirect_to posts_path
    end

  end

  def set_role
    if current_user.role == "recruteur"
      redirect_to recruteurs_path
    end
  end

  def set_profile
    @user = User.find(params[:id])
  end

  def params_create
    params.require('/profiles').permit(:id, :email, :nom, :prenom, :departement, :telephone, :date_de_naissance, :sexe, :infos, :role, :avatar, :photo)
  end
end
