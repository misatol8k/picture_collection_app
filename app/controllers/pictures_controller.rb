class PicturesController < ApplicationController
  before_action :authenticate_user
  before_action :set_picture, only: [:show, :edit, :update, :destroy]
  before_action :creator_user, only: [:edit, :update, :destroy]

  def index
    @pictures = Picture.all
  end

  def new
    @picture = current_user.pictures.build
  end

  def show
    @favorite = current_user.favorites.find_by(picture_id: @picture.id)
  end

  def edit
  end

  def create
    @picture = current_user.pictures.build(picture_params)
    if params[:back]
      render :new
    else
      if @picture.save
        # PostMailer.post_mail(@current_user, @picture).deliver
        redirect_to pictures_path, notice: "投稿しました！"
      else
        render :new
      end
    end
  end

  def confirm
    @picture = current_user.pictures.build(picture_params)
    render :new if @picture.invalid?
  end

  def update
    if @picture.update(picture_params)
      redirect_to pictures_path, notice: "更新しました！"
    else
      render :edit
    end
  end

  def destroy
    @picture.destroy
    respond_to do |format|
      format.html { redirect_to pictures_url, notice: '削除しました！' }
      format.json { head :no_content }
    end
  end

  private

  def set_picture
    @picture = Picture.find(params[:id])
  end

  def picture_params
    params.require(:picture).permit(:title, :content, :image, :image_cache, :user_id)
  end

  def creator_user
    unless @picture.user_id == current_user.id
      flash[:notice] = 'この記事は編集・削除できません'
      redirect_to pictures_path
    end
  end
end
