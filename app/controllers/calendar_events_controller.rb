class CalendarEventsController < ApplicationController
  before_action only: [:edit, :update] { |c| c.authorize_update_by_profile_id params[:id] }
  before_action only: [:show] { |c| c.authorize_show_by_profile_id params[:id] }
  before_action only: [:notifications] { |c| c.authorize_show_by_profile_id params[:calendar_event_id] }

  before_action only: [:show, :edit, :update, :destroy] { |c| c.set_calendar_event params[:id] }
  before_action only: [:notifications] { |c| c.set_calendar_event params[:calendar_event_id] }

  before_action :deny_non_admins, only: [:destroy]
  
  def notifications
    @notifications =@calendar_event.notifications
     respond_to do |format|
      format.json { render json: wrap_response(:notifications, @notifications) }
      format.html { render action: '../notifications/index.html.erb' } 
    end
  end

  # GET /calendar_events
  # GET /calendar_events.json
  def index
    @calendar_events = CalendarEvent.all
    respond_to do |format|
      format.json { render json: wrap_response(:calendar_events, @calendar_events) }
      format.html
    end
  end

  # GET /calendar_events/1
  # GET /calendar_events/1.json
  def show

    respond_to do |format|
      format.json { render json: wrap_response(:calendar_events, @calendar_event) }
      format.html
    end
  end

  # GET /calendar_events/new
  def new
    @calendar_event = CalendarEvent.new
  end

  # GET /calendar_events/1/edit
  def edit
  end

  # POST /calendar_events
  # POST /calendar_events.json
  def create
    @calendar_event = CalendarEvent.new(calendar_event_params)
    set_created @calendar_event, 'active'   
    respond_to do |format|
      if @calendar_event.save
        format.html { redirect_to @calendar_event, notice: 'Calendar event was successfully created.' }
        format.json { render :show, status: :created, location: @calendar_event }
      else
        format.html { render :new }
        format.json { render json: @calendar_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /calendar_events/1
  # PATCH/PUT /calendar_events/1.json
  def update
    set_updated @calendar_event
    respond_to do |format|
      if @calendar_event.update(calendar_event_params)
        format.html { redirect_to @calendar_event, notice: 'Calendar event was successfully updated.' }
        format.json { render :show, status: :ok, location: @calendar_event }
      else
        format.html { render :edit }
        format.json { render json: @calendar_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /calendar_events/1
  # DELETE /calendar_events/1.json
  def destroy
    @calendar_event.destroy
    respond_to do |format|
      format.html { redirect_to calendar_events_url, notice: 'Calendar event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def set_calendar_event id
    @calendar_event = CalendarEvent.find_by_id(id)
    return head(:not_found) unless @calendar_event.present?
  end

  private

    
    def calendar_event_params
      params.require(:calendar_event).permit(:name, :description, :event_contact, :event_start, :event_end, :all_day, :visibility_id, :status, :profile_id, :group_id, :created_by, :updated_by)
    end
end


