class GroupsController < ApplicationController
  before_action only: [:edit, :update] { |c| c.authorize_update_by_profile_id params[:id] }
  before_action only: [:show] { |c| c.authorize_show_by_profile_id params[:id] }
  before_action only: [:actions, :members, :invites, :posts, :pages] { |c| c.authorize_show_by_profile_id params[:group_id] }

  before_action only: [:show, :edit, :update, :destroy] { |c| c.set_group params[:id] }
  before_action only: [:actions, :members, :invites, :posts, :pages] { |c| c.set_group params[:group_id] }

  before_action :deny_non_admins, only: [:destroy]

  def pages
    @pages = @group.pages
     respond_to do |format|
      format.json { render json: wrap_response(:pages, @pages) }
      format.html { render action: '../pages/index.html.erb' } 
    end
  end

  def new_page
     respond_to do |format|
      #format.json { redirect_to  }
      format.html { render action: '../pages/new.html.erb' } 
    end
  end

  def members
     @group_members = @group.group_members
     respond_to do |format|
      format.json { render json: wrap_response(:group_members, @group_members) }
      format.html { render action: '../group_members/index.html.erb' } 
    end
  end

  def invites
    @group_invites = @group.group_invites
    respond_to do |format|
      format.json { render json: wrap_response(:group_invites, @group_invites) }
      format.html { render action: '../group_invites/index.html.erb' } 
    end
  end

  def actions
     @group_actions = @group.group_actions
     respond_to do |format|
      format.json { render json: wrap_response(:group_actions, @group_actions) }
      format.html { render action: '../group_actions/index.html.erb' } 
    end
  end

  # GET /groups
  # GET /groups.json
  def index
    @groups = Group.all
    respond_to do |format|
      format.json { render json: wrap_response(:groups, @groups) }
      format.html
    end
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
    respond_to do |format|
      format.json { render json: wrap_response(:groups, @group) }
      format.html
    end
  end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # GET /groups/1/edit
  def edit
  end

  # POST /groups
  # POST /groups.json
  def create
    @group = Group.new(group_params)
    set_created @group, 'active'  
    respond_to do |format|
      if @group.save
        format.html { redirect_to @group, notice: 'Group was successfully created.' }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
    set_updated @group 
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def set_group id
    @group = Group.find_by_id(id)
    return head(:not_found) unless @group.present?
  end

  private

    
    def group_params
      params.require(:group).permit(:name, :description, :status, :created_by, :updated_by, :visibility_id, :group_type, :profile_id)
    end
end
