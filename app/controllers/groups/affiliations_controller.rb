class Groups::AffiliationsController < ApplicationController
  # 管理者のみアクセス可
  before_action :admin_user!
  before_action :set_group

  def index
    render plain: "Hello, Rails!"
  end

  private
    def set_group
      @group = Group.find(params[:id])
    end

    def affiliation_params
      params.require(:affiliation).permit(:group_id, :user_id)
    end
    
    def admin_user!
      raise CanCan::AccessDenied unless current_user.try(:admin_flg?)
    end
end
