class NotifierMailer < ApplicationMailer
  def notify
    @to = params[:details][:to]
    @subject = params[:details][:subject]
    @body = params[:details][:body]

    mail(to: @to, subject: @subject)
  end
end
