class VoteOptionsController < ApplicationController
  before_action only: [:edit, :update] { |c| c.authorize_update_by_profile_id params[:id] }
  before_action only: [:show] { |c| c.authorize_show_by_profile_id params[:id] }

  before_action only: [:show, :edit, :update, :destroy] { |c| c.set_vote_option params[:id] }
  
  before_action :deny_non_admins, only: [:destroy]

  # GET /vote_options
  # GET /vote_options.json
  def index
    @vote_options = VoteOption.all
    respond_to do |format|
      format.json { render json: wrap_response(:vote_options, @vote_options) }
      format.html
    end
  end

  # GET /vote_options/1
  # GET /vote_options/1.json
  def show
    respond_to do |format|
      format.json { render json: wrap_response(:vote_options, @vote_option) }
      format.html
    end
  end

  # GET /vote_options/new
  def new
    @vote_option = VoteOption.new
  end

  # GET /vote_options/1/edit
  def edit
  end

  # POST /vote_options
  # POST /vote_options.json
  def create
    @vote_option = VoteOption.new(vote_option_params)
    set_created @vote_option, 'active'  
    #add a widget style

    respond_to do |format|
      if @vote_option.save
        format.html { redirect_to @vote_option, notice: 'Vote option was successfully created.' }
        format.json { render :show, status: :created, location: @vote_option }
      else
        format.html { render :new }
        format.json { render json: @vote_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vote_options/1
  # PATCH/PUT /vote_options/1.json
  def update
    set_updated @vote_option
    respond_to do |format|
      if @vote_option.update(vote_option_params)
        format.html { redirect_to @vote_option, notice: 'Vote option was successfully updated.' }
        format.json { render :show, status: :ok, location: @vote_option }
      else
        format.html { render :edit }
        format.json { render json: @vote_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vote_options/1
  # DELETE /vote_options/1.json
  def destroy
    @vote_option.destroy
    respond_to do |format|
      format.html { redirect_to vote_options_url, notice: 'Vote option was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

 def set_vote_option id
    @vote_option = VoteOption.find_by_id(id)
    return head(:not_found) unless @vote_option.present?
  end

  private
    
   

    
    def vote_option_params
      params.require(:vote_option).permit(:name, :description, :value, :image, :widget_style_id, :created_by, :updated_by)
    end
end
