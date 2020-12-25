class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
    # @picture = current_user.pictures.build(picture_params)
    # if @picture.update(picture_params)
    #   redirect_to pictures_path, notice: "更新しました！"
    # else
    #   render :edit
    # end
  end

  def destroy
    # 記載する
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation,
                                 :image, :image_cache)
  end
end
