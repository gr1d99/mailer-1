class NotifierJob < ApplicationJob
  queue_as :default

  def perform(details)
    NotifierMailer.with(details: details).notify.deliver_later
  end
end
