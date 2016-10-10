class UsersController < ApplicationController
  before_action only: [:edit, :update] { |c| c.authorize_update_by_profile_id params[:id] }
  before_action only: [:show] { |c| c.authorize_show_by_profile_id params[:id] }
  before_action only: [:profiles] { |c| c.authorize_show_by_profile_id params[:user_id] }

  before_action only: [:show, :edit, :update, :destroy] { |c| c.set_user params[:id] }
  before_action only: [:profiles] { |c| c.set_user params[:user_id] }

  before_action :deny_non_admins, only: [:destroy]

  def profiles    
    @profiles = @user.profiles
    respond_to do |format|
      format.json { render json: wrap_response(:profiles, @profiles) }
      format.html { render action: '../profiles/index.html.erb' } 
    end
  end

  # GET /users
  # GET /users.json
  def index
    @users = User.all
    respond_to do |format|
      format.json { render json: wrap_response(:users, @users) }
      format.html
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    respond_to do |format|
      format.json { render json: wrap_response(:users, @user) }
      format.html
    end
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    set_created @user, 'active'  
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    set_updated @user
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def set_user id
    @user = User.find_by_id(id)
    return head(:not_found) unless @user.present?
  end

  private
    
    def user_params
      params.require(:user).permit(:account_id, :username, :unique_name, :first_name, :last_name, :status, :profile_responsibility_date, :created_by, :updated_by, :avatar, :bio, :state, :country, :tagline, :theme_music)
    end
end
