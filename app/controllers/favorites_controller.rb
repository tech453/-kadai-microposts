class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    
    micropost=Micropost.find(params[:favorite_micropost_id])
    current_user.favorite(micropost)
    flash[:success]='お気に入りに追加しました。'
    url=request.referer
    user=User.find(micropost.user_id)
    
    #お気に入りページでリダイレクトする場合は、お気に入りページへリダイレクトする。
    #マイクロポストページでリダイレクトする場合は、マイクロポストページにリダイレクト
    #destroyも同様
    if url.include?('likes')
      redirect_to likes_user_path(user)
    else
      redirect_to user
    end
  end

  def destroy
    micropost=Micropost.find(params[:favorite_micropost_id])
    user=User.find(micropost.user_id)
    current_user.unfavorite(micropost)
    flash[:success]='お気に入りから外しました。'
    url=request.referer
    if url.include?('likes')
      redirect_to likes_user_path(user)
    else
      redirect_to user
    end
  end
end
