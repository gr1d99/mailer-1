class NotificationsController < ApplicationController
  def new; end

  def create
    NotifierJob.perform_later(notification_params)
    redirect_to root_path
  end

  private

  def notification_params
    { to: params[:to], subject: params[:subject], body: params[:body] }
  end
end
