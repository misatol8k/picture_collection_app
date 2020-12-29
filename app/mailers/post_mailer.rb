class PostMailer < ApplicationMailer
  def post_mail(current_user, picture)
    @current_user = current_user
    @picture = picture
    mail to: @current_user.email , subject: "投稿確認メール"
  end
end
