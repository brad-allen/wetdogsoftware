class ProfileActionsController < ApplicationController
  before_action only: [:edit, :update] { |c| c.authorize_update_by_profile_id params[:id] }
  before_action only: [:show] { |c| c.authorize_show_by_profile_id params[:id] }

  before_action only: [:show, :edit, :update, :destroy] { |c| c.set_profile_action params[:id] }
  
  before_action :deny_non_admins, only: [:destroy]

  # GET /profile_actions
  # GET /profile_actions.json
  def index
    @profile_actions = ProfileAction.all
    respond_to do |format|
      format.json { render json: wrap_response(:profile_actions, @profile_actions) }
      format.html
    end
  end

  # GET /profile_actions/1
  # GET /profile_actions/1.json
  def show
    respond_to do |format|
      format.json { render json: wrap_response(:profile_actions, @profile_action) }
      format.html
    end
  end

  # GET /profile_actions/new
  def new
    @profile_action = ProfileAction.new
  end

  # GET /profile_actions/1/edit
  def edit
  end

  # POST /profile_actions
  # POST /profile_actions.json
  def create
    @profile_action = ProfileAction.new(profile_action_params)
    set_created @profile_action, 'active'  
    respond_to do |format|
      if @profile_action.save
        format.html { redirect_to @profile_action, notice: 'Profile action was successfully created.' }
        format.json { render :show, status: :created, location: @profile_action }
      else
        format.html { render :new }
        format.json { render json: @profile_action.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profile_actions/1
  # PATCH/PUT /profile_actions/1.json
  def update
    set_updated @profile_action
    respond_to do |format|
      if @profile_action.update(profile_action_params)
        format.html { redirect_to @profile_action, notice: 'Profile action was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile_action }
      else
        format.html { render :edit }
        format.json { render json: @profile_action.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profile_actions/1
  # DELETE /profile_actions/1.json
  def destroy
    @profile_action.destroy
    respond_to do |format|
      format.html { redirect_to profile_actions_url, notice: 'Profile action was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def set_profile_action id
    @profile_action = ProfileAction.find_by_id(id)
    return head(:not_found) unless @profile_action.present?
  end

  private    

    def profile_action_params
      params.require(:profile_action).permit(:profile_id, :action, :description, :visibility_id, :status, :created_by, :updated_by)
    end
end
