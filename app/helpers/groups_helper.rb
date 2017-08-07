module GroupsHelper
  # 参加ユーザー
  def join_users(event)
    Confirmation.includes(:user).where(event: event, onoff: 1).select(user: [:username]).pluck(:username).uniq
  end
  
  # 不参加ユーザー
  def not_join_users(event)
    not_join_users ||=Confirmation.includes(:user).where(event: event, onoff: 2).select(user: [:username]).pluck(:username).uniq
  end
  
  # 未回答ユーザー
  def no_sign_users(event)
    no_sign_users = event.groups.first.users.where.not(id: event.confirmations.where(onoff: 1).or(event.confirmations.where(onoff: 2)).select(:user_id).pluck(:user_id))
    no_sign_users.select(user: [:username]).pluck(:username).uniq
  end
end
