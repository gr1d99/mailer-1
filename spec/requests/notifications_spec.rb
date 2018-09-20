require 'rails_helper'

RSpec.describe "Notifications", type: :request do
  let(:params) do
    {
      to: 'testuser@example.com',
      subject: 'Test notification',
      body: 'You are hereby notified'
    }
  end
  let(:last_email) { ActionMailer::Base.deliveries.last }

  describe 'POST /create' do
    it 'returns status 200' do
      post '/create', params: params
      expect(response.status).to eq(302)
    end

    it 'sends correct email' do
      perform_enqueued_jobs do
        post '/create', params: params
      end
      expect(last_email.to).to eq([params[:to]])
      expect(last_email.subject).to eq(params[:subject])
      expect(last_email.body.encoded).to include(params[:body])
    end
  end
end
