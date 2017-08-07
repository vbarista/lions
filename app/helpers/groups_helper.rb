module GroupsHelper
  def join_users(event)
    Confirmation.includes(:user).where(event: event, onoff: true).select(user: [:username]).pluck(:username).uniq
  end
end
