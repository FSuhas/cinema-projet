class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def candidat
    @user = current_user
    @post = Post.all
  end

  def profile
    @user = current_user
  end
end