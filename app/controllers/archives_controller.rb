class ArchivesController < ApplicationController

  def archive
    @user = current_user
  end
end
