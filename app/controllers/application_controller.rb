class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  def authenticate_user
    if @current_user == nil
      flash[:notice] = t('notice.login_needed')
      redirect_to new_session_path
    end
  end

  def creator_user
    unless current_user.id == @picture.user_id
      flash[:notice] = 'この記事は編集・削除できません'
      redirect_to pictures_path
    end
  end

  def match_user
    unless current_user.id == @user.id
      flash[:notice] = 'このユーザーは編集・削除できません'
      redirect_to pictures_path
    end
  end
end
