require 'rails_helper'

RSpec.describe CreateAdminResetPasswordJob, type: :job do
  let(:admin) { create(:admin, reset_password_token: '111111', reset_password_sent_at: Time.now) }
  let(:redirect_url) { "admin.mlcan.com" }
  let(:job) { 
    CreateAdminResetPasswordJob.perform_now(admin, redirect_url) 
  }

  it 'success' do
  	expect(job.id).to eql(admin.id)
  	expect(ActionMailer::Base.deliveries.count).to eql(1)
    expect(ActionMailer::Base.deliveries.last.subject).to eql('Reset Password')
  end
end
