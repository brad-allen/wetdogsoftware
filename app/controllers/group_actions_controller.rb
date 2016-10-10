class GroupActionsController < ApplicationController
  before_action only: [:edit, :update] { |c| c.authorize_update_by_profile_id params[:id] }
  before_action only: [:show] { |c| c.authorize_show_by_profile_id params[:id] }

  before_action only: [:show, :edit, :update, :destroy] { |c| c.set_group_action params[:id] }
  
  before_action :deny_non_admins, only: [:destroy]


  # GET /group_actions
  # GET /group_actions.json
  def index
    @group_actions = GroupAction.all
    respond_to do |format|
      format.json { render json: wrap_response(:group_actions, @group_actions) }
      format.html
    end
  end

  # GET /group_actions/1
  # GET /group_actions/1.json
  def show
    respond_to do |format|
      format.json { render json: wrap_response(:group_actions, @group_action) }
      format.html
    end
  end

  # GET /group_actions/new
  def new
    @group_action = GroupAction.new
    @group_action.group_id = params[:group_id]
  end

  # GET /group_actions/1/edit
  def edit
  end

  # POST /group_actions
  # POST /group_actions.json
  def create
    @group_action = GroupAction.new(group_action_params)
    set_created @group_action, 'active'  
    respond_to do |format|
      if @group_action.save
        format.html { redirect_to @group_action, notice: 'Group action was successfully created.' }
        format.json { render :show, status: :created, location: @group_action }
      else
        format.html { render :new }
        format.json { render json: @group_action.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /group_actions/1
  # PATCH/PUT /group_actions/1.json
  def update
    set_updated @group_action
    respond_to do |format|
      if @group_action.update(group_action_params)
        format.html { redirect_to @group_action, notice: 'Group action was successfully updated.' }
        format.json { render :show, status: :ok, location: @group_action }
      else
        format.html { render :edit }
        format.json { render json: @group_action.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /group_actions/1
  # DELETE /group_actions/1.json
  def destroy
    @group_action.destroy
    respond_to do |format|
      format.html { redirect_to group_actions_url, notice: 'Group action was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def set_group_action id
    @group_action = GroupAction.find_by_id(id)
    return head(:not_found) unless @group_action.present?
  end

  private
    
    def group_action_params
      params.require(:group_action).permit(:group_id, :profile_id, :action, :description, :visibility_id, :status, :created_by, :updated_by)
    end
end
