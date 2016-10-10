class GroupInvitesController < ApplicationController
  before_action only: [:edit, :update] { |c| c.authorize_update_by_profile_id params[:id] }
  before_action only: [:show] { |c| c.authorize_show_by_profile_id params[:id] }

  before_action only: [:show, :edit, :update, :destroy] { |c| c.set_group_invite params[:id] }
  
  before_action :deny_non_admins, only: [:destroy]

  # GET /group_invites
  # GET /group_invites.json
  def index
    @group_invites = GroupInvite.all
    respond_to do |format|
      format.json { render json: wrap_response(:group_invites, @group_invites) }
      format.html
    end
  end

  # GET /group_invites/1
  # GET /group_invites/1.json
  def show
    respond_to do |format|
      format.json { render json: wrap_response(:group_invites, @group_invite) }
      format.html
    end
  end

  # GET /group_invites/new
  def new
    @group_invite = GroupInvite.new
    @group_invite.group_id = params[:group_id]
  end

  # GET /group_invites/1/edit
  def edit
  end

  # POST /group_invites
  # POST /group_invites.json
  def create
    @group_invite = GroupInvite.new(group_invite_params)
    set_created @group_invite, 'invited'  
    respond_to do |format|
      if @group_invite.save
        format.html { redirect_to @group_invite, notice: 'Group invite was successfully created.' }
        format.json { render :show, status: :created, location: @group_invite }
      else
        format.html { render :new }
        format.json { render json: @group_invite.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /group_invites/1
  # PATCH/PUT /group_invites/1.json
  def update
    set_updated @group_invite
    respond_to do |format|
      if @group_invite.update(group_invite_params)
        format.html { redirect_to @group_invite, notice: 'Group invite was successfully updated.' }
        format.json { render :show, status: :ok, location: @group_invite }
      else
        format.html { render :edit }
        format.json { render json: @group_invite.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /group_invites/1
  # DELETE /group_invites/1.json
  def destroy
    @group_invite.destroy
    respond_to do |format|
      format.html { redirect_to group_invites_url, notice: 'Group invite was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def set_group_invite id
    @group_invite = GroupInvite.find_by_id(id)
    return head(:not_found) unless @group_invite.present?
  end


  private
    
    def group_invite_params
      params.require(:group_invite).permit(:group_id, :profile_id, :status, :invited_at, :reinvited_at, :rejected_at, :accepted_at, :created_by, :updated_by, :is_admin, :can_post, :can_add_events, :can_comment)
    end
end
