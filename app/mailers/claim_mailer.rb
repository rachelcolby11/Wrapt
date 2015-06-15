class ClaimMailer < ApplicationMailer
   default from: "rachelcolby11@gmail.com"

   def claim_reminder(claim)
 
     headers["Message-ID"] = "<no-reply@wrapt.herokuapp.com>"
     headers["In-Reply-To"] = "<no-reply@gmail.com>"
     headers["References"] = "<no-reply@wrapt.herokuapp.com>"

     @claim = claim
     @user = claim.user
     @item = claim.item
     @friend = @item.user
 
     mail(to: user.email, subject: "Gift reminder from Wrapt!")
   end

end
