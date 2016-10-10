class ConnectionInvitesController < ApplicationController
  before_action only: [:edit, :update] { |c| c.authorize_update_by_profile_id params[:id] }
  before_action only: [:show] { |c| c.authorize_show_by_profile_id params[:id] }

  before_action only: [:show, :edit, :update, :destroy] { |c| c.set_connection_invite params[:id] }
  
  before_action :deny_non_admins, only: [:destroy]

  # GET /connection_invites
  # GET /connection_invites.json
  def index
    @connection_invites = ConnectionInvite.all
    respond_to do |format|
      format.json { render json: wrap_response(:connection_invites, @connection_invites) }
      format.html
    end
  end

  # GET /connection_invites/1
  # GET /connection_invites/1.json
  def show
    respond_to do |format|
      format.json { render json: wrap_response(:connection_invites, @connection_invite) }
      format.html
    end
  end

  # GET /connection_invites/new
  def new
    @connection_invite = ConnectionInvite.new
  end

  # GET /connection_invites/1/edit
  def edit
  end

  # POST /connection_invites
  # POST /connection_invites.json
  def create
    @connection_invite = ConnectionInvite.new(connection_invite_params)
    set_created @connection_invite, 'invited'  
    respond_to do |format|
      if @connection_invite.save
        format.html { redirect_to @connection_invite, notice: 'Connection invite was successfully created.' }
        format.json { render :show, status: :created, location: @connection_invite }
      else
        format.html { render :new }
        format.json { render json: @connection_invite.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /connection_invites/1
  # PATCH/PUT /connection_invites/1.json
  def update
    set_updated @connection_invite
    respond_to do |format|
      if @connection_invite.update(connection_invite_params)
        format.html { redirect_to @connection_invite, notice: 'Connection invite was successfully updated.' }
        format.json { render :show, status: :ok, location: @connection_invite }
      else
        format.html { render :edit }
        format.json { render json: @connection_invite.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /connection_invites/1
  # DELETE /connection_invites/1.json
  def destroy
    @connection_invite.destroy
    respond_to do |format|
      format.html { redirect_to connection_invites_url, notice: 'Connection invite was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def set_connection_invite id
    @connection_invite = ConnectionInvite.find_by_id(id)
    return head(:not_found) unless @connection_invite.present?
  end
  end

  private
    
    def connection_invite_params
      params.require(:connection_invite).permit(:profile_id, :connection_profile_id, :status, :invited_at, :reinvited_at, :rejected_at, :accepted_at, :created_by, :updated_by)
    end
end
