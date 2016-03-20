class Example < ActionMailer::Base
  default from: "carlos@gmail.com"

  def welcome_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Bienvenido a mi sitio!')
  end
end
