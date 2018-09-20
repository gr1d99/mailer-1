# Preview all emails at http://localhost:3000/rails/mailers/notifier
class NotifierPreview < ActionMailer::Preview
  def notify
    details = {
      to: 'someuser@examples.com',
      subject: 'some subject',
      body: 'some body'
    }
    NotifierMailer.with(details: details).notify
  end
end
