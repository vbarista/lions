module ApplicationHelper
  def admin_user?
    current_user.try(:admin_flg?)
  end

  def edit_user?
    current_user.try(:admin_flg?) || current_user.try(:edit_flg?)
  end
end
