class EventsController < ApplicationController
  before_action :set_event, only: [:edit, :update, :destroy, :edit_confirmation, :update_confirmation]
  # ユーザがログインしていないとアクセスできない
  before_action :authenticate_user!
  # 参加可否の受付画面
  before_action :set_confirmation, only: [:edit_confirmation, :update_confirmation]
  
  # GET /events
  def index
    @events = Event.all
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # POST /events
  def create
    @event = Event.new(event_params)
    @event.user = current_user

    respond_to do |format|
      if @event.save
        format.html { redirect_to events_path, notice: '正常に登録が完了しました。' }
      else
        format.html { render :new }
      end
    end
  end

  # GET /events/1/edit
  def edit
  end

  # PATCH/PUT /events/1
  def update
    binding.pry
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to events_path, notice: '正常に更新が完了しました。' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /events/1
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: '正常に削除が完了しました。' }
    end
  end

  # イベント参加・不参加受付
  def update_confirmation
    respond_to do |format|
      if @confirmation.update(confirmation_params)
        format.html { redirect_to edit_confirmation_event_path(@event), notice: '正常に受付登録が完了しました。' }
      else
        format.html { render :edit_confirmation, notice: '登録エラー' }
      end
    end
  end

  private
    def set_event
      @event ||= Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:title, :datetime, :contents, group_ids: [])
    end
    
    def set_confirmation
      @confirmation ||= @event.confirmations.find_or_create_by(user: current_user)
    end
    
    def confirmation_params
      params.require(:confirmation)
            .permit(:onoff,
                    :reason_for_off,
                    :guest1_company,
                    :guest1_position,
                    :guest1_name,
                    :guest2_company,
                    :guest2_position,
                    :guest2_name,
                    :guest3_company,
                    :guest3_position,
                    :guest3_name,
                    :guest4_company,
                    :guest4_position,
                    :guest4_name,
                    :guest5_company,
                    :guest5_position,
                    :guest5_name,
                  )
    end
end
