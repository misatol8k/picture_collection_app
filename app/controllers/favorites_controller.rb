class FavoritesController < ApplicationController
  before_action :authenticate_user
  def show
    @favorites = current_user.favorite_pictures
  end

  def create
    @favorite = current_user.favorites.create(picture_id: params[:picture_id])
    redirect_to pictures_url, notice: "#{@favorite.picture.user.name}さんの記事をお気に入り登録しました"
  end

  def destroy
    @favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to pictures_url, notice: "#{@favorite.picture.user.name}さんの記事をお気に入り解除しました"
  end

end
