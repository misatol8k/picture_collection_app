module PicturesHelper
  def choose_new_or_edit
    if action_name == 'new' || action_name == 'create'
      confirm_pictures_path
    elsif action_name == 'edit'
      picture_path
    end
  end
  def favorite_present
    unless @picture.user_id == current_user.id
      if @favorite.present?
        link_to 'お気に入り解除する', favorite_path(id: @favorite.id), method: :delete, class: 'btn btn-danger'
      else
        link_to 'お気に入りする', favorites_path(picture_id: @picture.id), method: :post, class: 'btn btn-primary'
      end
    end
  end

  def creator_user_edit
    if @picture.user_id == current_user.id
      link_to '編集', edit_picture_path(@picture)
    end
  end

  def creator_user_destroy
    if @picture.user_id == current_user.id
      link_to '削除', @picture, method: :delete, data: { confirm: '削除しますか？' }
    end
  end


    def creator_user
      unless @picture.user_id == current_user.id
        flash[:notice] = 'この記事は編集・削除できません'
        redirect_to pictures_path
      end
    end

end
