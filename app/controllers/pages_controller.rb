class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end


  private

  def params_create
    params.require('/candidat').permit(:id, :email, :nom, :prenom, :departement, :telephone, :date_de_naissance, :sexe, :infos, :role, :avatar, :photo)
  end

  def set_profile
    @user = User.find(params[:id])
  end
end
