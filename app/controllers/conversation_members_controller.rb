class ConversationMembersController < ApplicationController
  before_action only: [:edit, :update] { |c| c.authorize_update_by_profile_id params[:id] }
  before_action only: [:show] { |c| c.authorize_show_by_profile_id params[:id] }

  before_action only: [:show, :edit, :update, :destroy] { |c| c.set_conversation_member params[:id] }
  
  before_action :deny_non_admins, only: [:destroy]

  # GET /conversation_members
  # GET /conversation_members.json
  def index
    @conversation_members = ConversationMember.all
    respond_to do |format|
      format.json { render json: wrap_response(:conversation_members, @conversation_members) }
      format.html
    end
  end

  # GET /conversation_members/1
  # GET /conversation_members/1.json
  def show
    respond_to do |format|
      format.json { render json: wrap_response(:conversation_members, @conversation_member) }
      format.html
    end
  end

  # GET /conversation_members/new
  def new
    @conversation_member = ConversationMember.new
  end

  # GET /conversation_members/1/edit
  def edit
  end

  # POST /conversation_members
  # POST /conversation_members.json
  def create
    @conversation_member = ConversationMember.new(conversation_member_params)
    set_created @conversation_member, 'active'  
    respond_to do |format|
      if @conversation_member.save
        format.html { redirect_to @conversation_member, notice: 'Conversation member was successfully created.' }
        format.json { render :show, status: :created, location: @conversation_member }
      else
        format.html { render :new }
        format.json { render json: @conversation_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /conversation_members/1
  # PATCH/PUT /conversation_members/1.json
  def update
    set_updated @conversation_member
    respond_to do |format|
      if @conversation_member.update(conversation_member_params)
        format.html { redirect_to @conversation_member, notice: 'Conversation member was successfully updated.' }
        format.json { render :show, status: :ok, location: @conversation_member }
      else
        format.html { render :edit }
        format.json { render json: @conversation_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /conversation_members/1
  # DELETE /conversation_members/1.json
  def destroy
    @conversation_member.destroy
    respond_to do |format|
      format.html { redirect_to conversation_members_url, notice: 'Conversation member was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
    
  def set_conversation_member id
    @conversation_member = ConversationMember.find_by_id(id)
    return head(:not_found) unless @conversation_member.present?
  end


  private
    
    def conversation_member_params
      params.require(:conversation_member).permit(:conversation_id, :profile_id, :status, :created_by, :updated_by)
    end
end
