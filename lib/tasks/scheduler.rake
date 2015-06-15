desc "This task is called by the Heroku scheduler add-on"
task :send_claim_reminders => :environment do

  Claim.connection.claims_to_remind.each do |claim|
    ClaimMailer.claim_reminder(claim).deliver_now
  end

  if claims_to_remind
    Rails.logger.info "#{claims_to_remind.count} emails sent."
  else
    Rails.logger.info "No emails sent."
  end
  
end