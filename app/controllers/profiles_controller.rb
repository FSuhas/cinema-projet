class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit]

  def profile
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
    params.require('/profile').permit(:id, :email, :nom, :prenom, :adresse, :telephone, :date_de_naissance, :sexe, :infos, :role)
  end
end
