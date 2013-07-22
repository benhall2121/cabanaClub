class CabanaclubMailer < ActionMailer::Base
  include ApplicationHelper
  default :from => "Website@benerino.com"
  
  def contact_email(sent_email)
    @sent_email = sent_email
    mail(:to => "ben@benerino.com", :subject => "Cabana Club - A new Message from: #{sent_email.email}")
  end

  def password_reset(user)
    @user = user
    mail :to => user.email, :subject => "Password Reset"
  end
end
