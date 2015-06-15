namespace :todo do
  desc "Send reminders to users with claims 7 days old"
  task send_claim_reminders: :environment do
    Claim.connection.claims_to_remind.each do |claim|
      ClaimMailer.claim_reminder(claim).deliver_now
    end
  end

end
