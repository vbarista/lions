class Groups::AffiliationsController < ApplicationController
  # 管理者のみアクセス可
  before_action :admin_user!
  before_action :set_group

  def index
  end
  
  def create
    @group. update_attributes(affiliations_params)

    respond_to do |format|
      if @group.save
        format.html { redirect_to group_path(@group.becomes(Group)), notice: 'Affiliation was successfully updated.' }
        format.json { render :show, status: :created, location: @group.becomes(Group) }
      else
        format.html { redirect_to group_path(@group.becomes(Group)), notice: 'Error.' }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_group
      @group = Group.find(params[:group_id]).becomes(Group)
    end

    def affiliations_params
      params.require(:affiliations).permit(user_ids: [])
    end
    
    def admin_user!
      raise CanCan::AccessDenied unless current_user.try(:admin_flg?)
    end
end
