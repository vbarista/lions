module ApplicationHelper
  def admin_user?
    current_user.try(:admin_flg?)
  end

  def edit_user?
    current_user.try(:admin_flg?) || current_user.try(:edit_flg?)
  end
  
  # イベントの作成者 or 管理者がイベント情報を編集可能
  def event_edit?(event)
    current_user.try(:admin_flg?) || event.try(:user) == current_user
  end
end
