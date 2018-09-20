require 'rails_helper'

RSpec.describe NotifierJob, type: :job do
  let(:mail_params) do
    { to: 'testuser@test.com',
      subject: 'Test Subject',
      body: 'Test body bla bla bla' }
  end

  it 'matches name of job' do
    expect { described_class.perform_later(mail_params) }
      .to have_enqueued_job(described_class)
  end

  it 'matches passed arguments' do
    expect {
      described_class.perform_later(mail_params)
    }.to have_enqueued_job.with(
      to: 'testuser@test.com',
      subject: 'Test Subject',
      body: 'Test body bla bla bla'
    )
  end

  it 'enqueue with set time' do
    expect {
      described_class.set(wait_until: DateTime.tomorrow.noon)
        .perform_later(mail_params)
    }.to have_enqueued_job.at(DateTime.tomorrow.noon)
  end

  it 'enqueues with no wait' do
    expect { described_class.perform_later(mail_params)}
      .to have_enqueued_job.at(:no_wait)
  end

  it 'enqueues' do
    expect {
      described_class.perform_later(mail_params)
    }. to have_enqueued_job
  end

  it 'enqueues on mailers queue' do
    expect {
      described_class.perform_later(mail_params)
    }.to have_enqueued_job.on_queue('default')
  end
end
