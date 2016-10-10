class ConversationsController < ApplicationController
  before_action only: [:edit, :update] { |c| c.authorize_update_by_profile_id params[:id] }
  before_action only: [:show] { |c| c.authorize_show_by_profile_id params[:id] }
  before_action only: [:messages, :members, :invites] { |c| c.authorize_show_by_profile_id params[:conversation_id] }

  before_action only: [:show, :edit, :update, :destroy] { |c| c.set_conversation params[:id] }
  before_action only: [:messages, :members, :invites] { |c| c.set_conversation params[:conversation_id] }

  before_action :deny_non_admins, only: [:destroy]

  def messages
    render json: 
    @messages = @conversation.messages
     respond_to do |format|
      format.json { render json: wrap_response(:messages, @messages) }
      format.html { render action: '../messages/index.html.erb' } 
    end
  end

  def members
    @conversation_members = @conversation.conversation_members
     respond_to do |format|
      format.json { render json: wrap_response(:conversation_members, @conversation_members) }
      format.html { render action: '../conversation_members/index.html.erb' } 
    end
  end

  def invites
    @conversation_invites = @conversation.conversation_invites
     respond_to do |format|
      format.json { render json: wrap_response(:conversation_invites, @conversation_invites) }
      format.html { render action: '../conversation_invites/index.html.erb' } 
    end
  end


  # GET /conversations
  # GET /conversations.json
  def index
    @conversations = Conversation.all
    respond_to do |format|
      format.json { render json: wrap_response(:conversations, @conversations) }
      format.html
    end
  end

  # GET /conversations/1
  # GET /conversations/1.json
  def show
    respond_to do |format|
      format.json { render json: wrap_response(:conversations, @conversation) }
      format.html
    end
  end

  # GET /conversations/new
  def new
    @conversation = Conversation.new
  end

  # GET /conversations/1/edit
  def edit
  end

  # POST /conversations
  # POST /conversations.json
  def create
    @conversation = Conversation.new(conversation_params)
    set_created @conversation, 'active' 
    respond_to do |format|
      if @conversation.save
        format.html { redirect_to @conversation, notice: 'Conversation was successfully created.' }
        format.json { render :show, status: :created, location: @conversation }
      else
        format.html { render :new }
        format.json { render json: @conversation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /conversations/1
  # PATCH/PUT /conversations/1.json
  def update
    set_updated @conversation
    respond_to do |format|
      if @conversation.update(conversation_params)
        format.html { redirect_to @conversation, notice: 'Conversation was successfully updated.' }
        format.json { render :show, status: :ok, location: @conversation }
      else
        format.html { render :edit }
        format.json { render json: @conversation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /conversations/1
  # DELETE /conversations/1.json
  def destroy
    @conversation.destroy
    respond_to do |format|
      format.html { redirect_to conversations_url, notice: 'Conversation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def set_conversation id
    @conversation = Conversation.find_by_id(id)
    return head(:not_found) unless @conversation.present?
  end

  private
    
    def conversation_params
      params.require(:conversation).permit(:title, :allow_html, :status, :created_by, :updated_by)
    end
end
