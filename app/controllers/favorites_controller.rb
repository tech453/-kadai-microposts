class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    
    micropost=Micropost.find(params[:favorite_micropost_id])
    current_user.favorite(micropost)
    flash[:success]='お気に入りに追加しました。'
    #お気に入りページでリダイレクトする場合は、お気に入りページへリダイレクトする。
    #マイクロポストページでリダイレクトする場合は、マイクロポストページにリダイレクト
    #destroyも同様
    current_url=request.referer
    redirect_to current_url
  end

  def destroy
    micropost=Micropost.find(params[:favorite_micropost_id])
    current_user.unfavorite(micropost)
    flash[:success]='お気に入りから外しました。'
    current_url=request.referer
    redirect_to current_url
  end
end
