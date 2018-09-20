class NotificationsController < ApplicationController
  def new; end

  def create
    NotifierMailer.with(details: notification_params).notify.deliver_now
    redirect_to root_path
  end

  private

  def notification_params
    params.permit(:to, :subject, :body)
  end
end
