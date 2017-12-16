class FailMailer < ApplicationMailer
  default from: 'notifications@mentoleading.com'
  def welcome_mail(user, sensor_loc)
    @user = user
    @sensor_loc = sensor_loc
    mail(to: @user.email, subject: "Failing Alert")
  end

end
