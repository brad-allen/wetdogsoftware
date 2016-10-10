class ProfilesController < ApplicationController
  before_action only: [:edit, :update] { |c| c.authorize_update_by_profile_id params[:id] }
  before_action only: [:show] { |c| c.authorize_show_by_profile_id params[:id] }
  before_action only: [:calendar_events, :comments, :posts, :connections, :connection_invites, :conversations, :profile_actions] { |c| c.authorize_show_by_profile_id params[:profile_id] }

  before_action only: [:show, :edit, :update, :destroy] { |c| c.set_profile params[:id] }
  before_action only: [:calendar_events, :comments, :posts, :connections, :connection_invites, :conversations, :profile_actions] { |c| c.set_profile params[:profile_id] }

  before_action :deny_non_admins, only: [:destroy]
  
  def get_fields      
      attribute_list = [:user_id, :profile_name, :first_name, :last_name, :status, :avatar, :bio, :state, :country, :tagline, :theme_music, :birth_date, :email, :allow_all_connections, :allow_emails, :allow_all_conversations, :inform_user_of_actions, :allow_all_groups, :visibility_id]      
      @profile = Profile.new      
      fields = Array.new

      attribute_list.each do |attribute|
        fieldDetail = FieldDetail.new
        fieldDetail.name = attribute.to_s
        fieldDetail.field_type = @profile.column_for_attribute(attribute).type.to_s
        fields.push(fieldDetail.to_json)              
      end

     respond_to do |format|
      format.json { render json: fields.to_s }
      format.html { render html: fields.to_s }
    end
  end

  def calendar_events
    @calendar_events = @profile.calendar_events
    respond_to do |format|
      format.json { render json: wrap_response(:calendar_events, @calendar_events) }
      format.html { render action: '../calendar_events/index.html.erb' } 
    end
  end

  def comments
    @comments = @profile.comments
    respond_to do |format|
      format.json { render json: wrap_response(:comments, @comments) }
      format.html { render action: '../comments/index.html.erb' } 
    end
  end

  def posts
    @posts = @profile.posts
     respond_to do |format|
      format.json { render json: wrap_response(:posts, @posts) }
      format.html { render action: '../posts/index.html.erb' } 
    end
  end

  def pages
    @pages = @profile.pages
    respond_to do |format|
      format.json { render json: wrap_response(:pages, @pages) }
      format.html { render action: '../pages/index.html.erb' } 
    end
  end

  def connections
    @connections = @profile.connections
    respond_to do |format|
      format.json { render json: wrap_response(:connections, @connections) }
      format.html { render action: '../connections/index.html.erb' } 
    end
  end

  def connection_invites
    @connection_invites = @profile.connection_invites
    respond_to do |format|
      format.json { render json: wrap_response(:connection_invites, @connection_invites) }
      format.html { render action: '../connection_invites/index.html.erb' } 
    end
  end

  def groups
    @groups = @profile.groups
    respond_to do |format|
      format.json { render json: wrap_response(:groups, @groups) }
      format.html { render action: '../groups/index.html.erb' } 
    end
  end

  def owned_groups
    @groups = @profile.groups
    respond_to do |format|
      format.json { render json: wrap_response(:groups, @@groups) }
      format.html { render action: '../groups/index.html.erb' } 
    end
  end

  def group_invites
    @group_invites = @profile.group_invites
    respond_to do |format|
      format.json { render json: wrap_response(:group_invites, @group_invites) }
      format.html { render action: '../group_invites/index.html.erb' } 
    end
  end

  def conversations
    @conversations = @profile.conversations
    respond_to do |format|
      format.json { render json: wrap_response(:conversations, @conversations) }
      format.html { render action: '../conversations/index.html.erb' } 
    end
  end

  def conversation_invites
    @conversation_invites = @profile.conversation_invites
    respond_to do |format|
      format.json { render json: wrap_response(:conversation_invites, @conversation_invites) }
      format.html { render action: '../conversation_invites/index.html.erb' } 
    end
  end

  def profile_actions
    @profile_actions = @profile.profile_actions
    respond_to do |format|
      format.json { render json: wrap_response(:profile_actions, @profile_actions) }
      format.html { render action: '../profile_actions/index.html.erb' } 
    end
  end

  # GET /profiles
  # GET /profiles.json
  def index
     @profiles = Profile.all
     respond_to do |format|
      format.json { render json: wrap_response(:profiles, @profiles) }
      format.html
    end

    #render json: @profiles
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
    respond_to do |format|
      format.json { render json: wrap_response(:profiles, @profile) }
      format.html
    end
  end

  # GET /profiles/new
  def new
    @profile = Profile.new
  end

  # GET /profiles/1/edit
  def edit
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @profile = Profile.new(profile_params)
    set_created @profile, 'active'  
    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, notice: 'Profile was successfully created.' }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    set_updated @profile
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url, notice: 'Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def set_profile id
    @profile = Profile.find_by_id(id)
    return head(:not_found) unless @profile.present?
  end

  private
    
    def profile_params
      params.require(:profile).permit(:user_id, :profile_name, :first_name, :last_name, :status, :created_by, :updated_by, :avatar, :bio, :state, :country, :tagline, :theme_music, :birth_date, :email, :allow_all_connections, :allow_emails, :allow_all_conversations, :inform_user_of_actions, :allow_all_groups, :visibility_id)
    end
end
