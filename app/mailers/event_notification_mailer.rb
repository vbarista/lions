class EventNotificationMailer < ApplicationMailer
  # デフォルトでの送信元のアドレス
  default from: 'from@example.com'

  def send2groups(event)
    @event = event
    emails = []
    event.groups.each do |group|
      emails.concat group.users.select(:email).pluck(:email)
    end
    
    emails.uniq.join(",")
    
    mail(
      subject: event.title.to_s, #メールのタイトル,
      to: emails.uniq.join(","), #宛先
    ) do |format|
      format.text
    end
  end
end
