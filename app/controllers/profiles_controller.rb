class ProfilesController < ApplicationController
  before_action :set_profile, only: [:edit, :show]

  def index
    @user = current_user
    @candidats = User.where(role: "candidat")
    @booking = Booking.where(confirmation: false).first
  end

  def show
    @user = current_user

  end

  def edit
  end

  def update
    if current_user.update(params_create)
      redirect_to profile_path
      flash[:notice] = "Mis à jour avec succès"
    else
      render profile_path, status: :unprocessable_entity
      flash[:notice] = "Veuillez remplir tous les champs"
    end
  end

  private

  def set_profile
    @user = User.find(params[:id])
  end

  def params_create
    params.require('/profile').permit(:id, :email, :nom, :prenom, :adresse, :telephone, :date_de_naissance, :sexe, :infos, :role, :avatar, :photo)
  end
end
