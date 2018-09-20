require "rails_helper"

RSpec.describe NotifierMailer, type: :mailer do
  let(:to) { 'anotheruser@example.com' }
  let(:email_subject) { 'Test Subject' }
  let(:body) { 'This is a test body' }
  let(:details) do
    {
      to: to,
      subject: email_subject,
      body: body
    }
  end
  let(:mail) { NotifierMailer.with(details: details).notify }

  it 'sends to right recipient' do
    expect(mail.to).to eq([to])
  end

  it 'sets correct subject' do
    expect(mail.subject).to eq(email_subject)
  end

  it 'has correct body' do
    expect(mail.body.encoded).to include(body)

  end
end

