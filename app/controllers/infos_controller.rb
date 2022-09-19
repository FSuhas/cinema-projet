class InfosController < ApplicationController
  before_action :set_profile, only: [:show, :edit]

  def infos
    @user = current_user
  end

  def edit
  end

  def update
    if current_user.update(params_create)
      redirect_to infos_path
      flash[:notice] = "Mis à jour avec succès"
    else
      flash[:notice] = "Veuillez remplir tous les champs"
    end
  end

  private

  def set_infos
    @user = User.find(params[:id])
  end

  def params_create
    params.require('/infos').permit(:id, :email, :nom, :prenom, :adresse, :telephone, :date_de_naissance, :sexe, :infos, :role)
  end
end