require 'rails_helper'

RSpec.describe CreateUserResetPasswordJob, type: :job do
  let(:user) { create(:user, reset_password_token: '111111', reset_password_sent_at: Time.now) }
  let(:job) { 
    CreateUserResetPasswordJob.perform_now(user) 
  }

  it 'success' do
  	expect(job.id).to eql(user.id)
  	expect(ActionMailer::Base.deliveries.count).to eql(1)
    expect(ActionMailer::Base.deliveries.last.subject).to eql('Reset Password')
  end
end
