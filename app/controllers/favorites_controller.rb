class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    micropost=Micropost.find(params[:favorite_micropost_id])
    current_user.favorite(micropost)
    flash[:success]='お気に入りに追加しました。'
    redirect_to User.find(micropost.user_id)
  end

  def destroy
    micropost=Micropost.find(params[:favorite_micropost_id])
    current_user.unfavorite(micropost)
    flash[:success]='お気に入りから外しました。'
    redirect_to User.find(micropost.user_id)
  end
end
