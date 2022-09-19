class InfosController < ApplicationController

  def infos
    @user = current_user
  end
end
