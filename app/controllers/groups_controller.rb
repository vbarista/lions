class GroupsController < ApplicationController
  # 管理者のみアクセス可
  before_action :admin_user!
  before_action :set_group, only: [:show, :edit, :update, :destroy, :commit_user_to_affiliation]

  # GET /groups
  # GET /groups.json
  def index
    @groups = Group.all
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
  end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # GET /groups/1/edit
  def edit
  end

  # POST /groups
  # POST /groups.json
  def create
    @group = Group.new(group_params)

    respond_to do |format|
      if @group.save
        format.html { redirect_to @group.becomes(Group), notice: 'Group was successfully created.' }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  # PATCH /commit_user_to_affiliation
  # 委員会とユーザーを紐付ける
  def commit_user_to_affiliation
    @group. update_attributes(affiliations_params)

    respond_to do |format|
      if @group.save
        format.html { redirect_to group_path(@group.becomes(Group)), notice: 'Affiliation was successfully updated.' }
      else
        format.html { redirect_to group_path(@group.becomes(Group)), notice: 'Error.' }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
      params.require(:group).permit(:type, :name)
    end
    
    def admin_user!
      raise CanCan::AccessDenied unless current_user.try(:admin_flg?)
    end

    def affiliations_params
      params.require(:group).permit(user_ids: [])
    end
end
