class InviteMailer < ApplicationMailer
  default from: "rachelcolby11@gmail.com"

  def new_invite(from_user, to_email)

     headers["Message-ID"] = "<no-reply@wrapt.herokuapp.com>"
     headers["In-Reply-To"] = "<no-reply@gmail.com>"
     headers["References"] = "<no-reply@wrapt.herokuapp.com>"
 
     @user = from_user
     @new_user = to_email
 
     mail(to: to_email, subject: "#{from_user.name} wants you to make a gift list on Wrapt!")
   end
end
