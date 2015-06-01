class InviteMailer < ApplicationMailer
  default from: "rachelcolby11@gmail.com"

  def new_invite(user, new_user_email)

     headers["Message-ID"] = "<user/#{user.id}@wrapt.herokuapp.com>"
     headers["In-Reply-To"] = "<user/rachelcolby11+#{user.id}@gmail.com>"
     headers["References"] = "<user/#{user.id}@wrapt.herokuapp.com>"
 
     @user = user
     @new_user = new_user_email
 
     mail(to: new_user_email, subject: "#{user.name} wants you to make a gift list on Wrapt!")
   end
end
