class UserMailer < ApplicationMailer
  default from: 'do-not-reply@persebox.com'

  def confirmation_email(user)
    @user = user
    mail(to: @user.email, subject: 'Confirmation de votre paiement')
  end
end
