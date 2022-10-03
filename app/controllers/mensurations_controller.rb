class MensurationsController < ApplicationController

  def mensuration
    @user = current_user
  end
end
