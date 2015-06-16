desc "This task is called by the Heroku scheduler add-on"
task :send_claim_reminders => :environment do

  reminders_to_send = Claim.claims_to_remind

  reminders_to_send.each do |claim|
    ClaimMailer.claim_reminder(claim).deliver_now
  end

  if reminders_to_send
    Rails.logger.info "#{reminders_to_send.count} emails sent."
  else
    Rails.logger.info "No emails sent."
  end

end