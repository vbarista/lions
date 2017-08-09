module EventsHelper
  # 参加ユーザー
  def join_users(event)
    Confirmation.includes(:user).where(event: event, onoff: 1).select(user: [:username]).pluck(:username).uniq
  end
  
  # 不参加ユーザー
  def not_join_users(event)
    Confirmation.includes(:user).where(event: event, onoff: 2).select(user: [:username]).pluck(:username).uniq
  end
  
  # 未回答ユーザー
  def no_sign_users(event)
    no_sign_users = []
    groups = event.groups
    groups.each do |group|
      no_sign_users.concat (
        group.users
             .where.not(id: event.confirmations.where(onoff: 1).or(event.confirmations.where(onoff: 2)))
             .select(:username)
             .pluck(:username)
      )
    end
    no_sign_users.uniq
  end
end
