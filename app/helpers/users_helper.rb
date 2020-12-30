module UsersHelper
  def match_user_edit
    if @user.id == current_user.id
      link_to '編集', edit_user_path(@user)
    end
  end

  def match_user_destroy
    if @user.id == current_user.id
      link_to '削除', @user, method: :delete, data: { confirm: '削除しますか？' }
    end
  end
end
