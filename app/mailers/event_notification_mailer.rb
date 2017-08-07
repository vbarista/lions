class EventNotificationMailer < ApplicationMailer
  # デフォルトでの送信元のアドレス
  default from: 'from@example.com'

  def send2groups(mailaddress)
    mail(
      subject: "送信テスト。", #メールのタイトル,
      to: mailaddress, #宛先
    ) do |format|
      format.text
    end
  end
end
