class DeleteConfirmation < ActionMailer::Base
  default from: "admin@gelp.com"

  def confirm(user)
    @user = user

    mail to: user.email,
      subject: 'Your Account was Deleted!'
  end
end
