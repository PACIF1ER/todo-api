class UserMailer < ActionMailer::Base
  default :from => 'mailertodoapp@gmail.com'

  def registration_confirmation(user, origin)
    @user = user
    @origin = origin
    mail(:to => "#{user.first_name} <#{user.email}>", :subject => "Registration Confirmation")
  end
end