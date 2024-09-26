class ApplicationMailer < ActionMailer::Base
  default from: "gardenhive@gmail.com"
  layout "mailer"

  def new_article_for_approval(article)
    @article = article
    @url = article_approval_url(@article.article_approval)
    mail(to: User.where(user_role: UserRole.where(role: ['admin', 'moderator'])).pluck(:email),
         subject: 'New Article Awaiting Approval')
  end

end
