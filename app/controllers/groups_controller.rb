class GroupsController < ApplicationController
  # 管理者のみアクセス可
  before_action :admin_user!
  before_action :set_group, only: [:show, :update, :destroy, :commit_user_to_affiliation]

  # GET /groups
  # GET /groups.json
  def index
    @groups = Group.all
  end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # POST /groups
  # POST /groups.json
  def create
    @group = Group.new(group_params)

    respond_to do |format|
      if @group.save
        format.html { redirect_to groups_path, notice: '正常に登録が完了しました。' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to groups_path, notice: '正常に更新が完了しました。' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url, notice: '正常に削除が完了しました。' }
    end
  end
  
  private
    def set_group
      @group = Group.find(params[:id])
    end

    def group_params
      params.require(:group).permit(:type, :name, user_ids: [])
    end
    
    def admin_user!
      raise CanCan::AccessDenied unless current_user.try(:admin_flg?)
    end
end
