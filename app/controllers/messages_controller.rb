class MessagesController < ApplicationController
  before_action only: [:edit, :update] { |c| c.authorize_update_by_profile_id params[:id] }
  before_action only: [:show] { |c| c.authorize_show_by_profile_id params[:id] }

  before_action only: [:show, :edit, :update, :destroy] { |c| c.set_message params[:id] }
  
  before_action :deny_non_admins, only: [:destroy]

  # GET /messages
  # GET /messages.json
  def index
    @messages = Message.all
    respond_to do |format|
      format.json { render json: wrap_response(:messages, @messages) }
      format.html
    end
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
    respond_to do |format|
      format.json { render json: wrap_response(:messages, @message) }
      format.html
    end
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(message_params)
    set_created @message, 'active'  
    respond_to do |format|
      if @message.save
        format.html { redirect_to @message, notice: 'Message was successfully created.' }
        format.json { render :show, status: :created, location: @message }
      else
        format.html { render :new }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /messages/1
  # PATCH/PUT /messages/1.json
  def update
    set_updated @message
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_url, notice: 'Message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end  
    
  def set_message id
    @message = Message.find_by_id(id)
    return head(:not_found) unless @message.present?
  end

  private
  
    def message_params
      params.require(:message).permit(:conversation_id, :profile_id, :content, :status, :created_by, :updated_by)
    end
end
