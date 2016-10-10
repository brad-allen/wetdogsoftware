class ConversationInvitesController < ApplicationController
  before_action only: [:edit, :update] { |c| c.authorize_update_by_profile_id params[:id] }
  before_action only: [:show] { |c| c.authorize_show_by_profile_id params[:id] }

  before_action only: [:show, :edit, :update, :destroy] { |c| c.set_conversation_invite params[:id] }
  
  before_action :deny_non_admins, only: [:destroy]

  # GET /conversation_invites
  # GET /conversation_invites.json
  def index
    @conversation_invites = ConversationInvite.all
    respond_to do |format|
      format.json { render json: wrap_response(:conversation_invites, @conversation_invites) }
      format.html
    end
  end

  # GET /conversation_invites/1
  # GET /conversation_invites/1.json
  def show
    respond_to do |format|
      format.json { render json: wrap_response(:conversation_invites, @conversation_invite) }
      format.html
    end
  end

  # GET /conversation_invites/new
  def new
    @conversation_invite = ConversationInvite.new
  end

  # GET /conversation_invites/1/edit
  def edit
  end

  # POST /conversation_invites
  # POST /conversation_invites.json
  def create
    @conversation_invite = ConversationInvite.new(conversation_invite_params)
    set_created @conversation_invite, 'invited'  
    respond_to do |format|
      if @conversation_invite.save
        format.html { redirect_to @conversation_invite, notice: 'Conversation invite was successfully created.' }
        format.json { render :show, status: :created, location: @conversation_invite }
      else
        format.html { render :new }
        format.json { render json: @conversation_invite.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /conversation_invites/1
  # PATCH/PUT /conversation_invites/1.json
  def update
    set_updated @conversation_invite
    respond_to do |format|
      if @conversation_invite.update(conversation_invite_params)
        format.html { redirect_to @conversation_invite, notice: 'Conversation invite was successfully updated.' }
        format.json { render :show, status: :ok, location: @conversation_invite }
      else
        format.html { render :edit }
        format.json { render json: @conversation_invite.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /conversation_invites/1
  # DELETE /conversation_invites/1.json
  def destroy
    @conversation_invite.destroy
    respond_to do |format|
      format.html { redirect_to conversation_invites_url, notice: 'Conversation invite was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def set_conversation_invite id
    @conversation_invite = ConversationInvite.find_by_id(id)
    return head(:not_found) unless @conversation_invite.present?
  end

  private
    
    def conversation_invite_params
      params.require(:conversation_invite).permit(:conversation_id, :profile_id, :invited_profile_id, :status, :invited_at, :reinvited_at, :rejected_at, :accepted_at, :created_by, :updated_by)
    end
end
