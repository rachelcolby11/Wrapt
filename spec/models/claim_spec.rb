require 'rails_helper'
 
  describe Claim do

    def authenticated_user(options={})
      user_options = {email: "email#{rand}@fake.com", password: 'password'}.merge(options)
      user = User.new(user_options)
      user.skip_confirmation!
      user.save
      user
    end

    def associated_claim(options={})
      claim_options = {
        item: Item.create(name: 'Item name'),
        user: authenticated_user,
        created_at: DateTime.now.to_date
      }.merge(options)
      Claim.create(claim_options)
    end

    describe "claim methods" do
   
      before do
        @claim = associated_claim
      end
   
      describe '#age_in_days' do
        it "counts the number of days that have passed since the claim was created" do
          expect( @claim.age_in_days ).to eq(0)
        end
      end
   
      describe '#self.claims_to_remind' do
        it "returns the claims for which the mailer should send reminders" do
          expect( Claim.claims_to_remind.count ).to eq(0)
        end
      end
   
    end
  end