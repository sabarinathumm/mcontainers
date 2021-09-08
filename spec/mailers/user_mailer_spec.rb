require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe 'send_reset_password_link' do
   	let(:user) { create(:user, reset_password_token: "111111", reset_password_sent_at: Time.now) }
    let(:mail) {
      described_class.send_reset_password_link(user).deliver_now 
    }

    it 'renders the subject' do
      expect(mail.subject).to eq('Reset Password')
    end

    it 'renders the receiver email' do
      expect(mail.to).to eq([user.email])
    end
  end
end
