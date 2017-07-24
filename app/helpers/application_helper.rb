module ApplicationHelper
  def admin_user?
    current_user.try(:admin_flg?)
  end
end
