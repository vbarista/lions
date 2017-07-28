class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy, :update_confirmation]
  # ユーザがログインしていないとアクセスできない
  before_action :authenticate_user!
  # 参加可否の受付画面
  before_action :set_confirmation, only: [:show, :update_confirmation]
  
  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: '作成完了' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: '更新完了' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: '削除しました。' }
      format.json { head :no_content }
    end
  end
  
  # PUT /confirmation/1
  def update_confirmation
    respond_to do |format|
      if @confirmation.update(confirmation_params)
        format.html { render :show }
        format.json { render json: @confirmation.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event ||= Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:title, :datetime, :contents)
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
