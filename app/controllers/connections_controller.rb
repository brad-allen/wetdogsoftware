class ConnectionsController < ApplicationController
  before_action only: [:edit, :update] { |c| c.authorize_update_by_profile_id params[:id] }
  before_action only: [:show] { |c| c.authorize_show_by_profile_id params[:id] }

  before_action only: [:show, :edit, :update, :destroy] { |c| c.set_connection params[:id] }
  
  before_action :deny_non_admins, only: [:destroy]

  # GET /connections
  # GET /connections.json
  def index
    @connections = Connection.all
    respond_to do |format|
      format.json { render json: wrap_response(:connections, @connections) }
      format.html
    end
  end

  # GET /connections/1
  # GET /connections/1.json
  def show
    respond_to do |format|
      format.json { render json: wrap_response(:connections, @connection) }
      format.html
    end
  end

  # GET /connections/new
  def new
    @connection = Connection.new
  end

  # GET /connections/1/edit
  def edit
  end

  # POST /connections
  # POST /connections.json
  def create
    @connection = Connection.new(connection_params)
    set_created @connection, 'invited'  
    respond_to do |format|
      if @connection.save
        format.html { redirect_to @connection, notice: 'Connection was successfully created.' }
        format.json { render :show, status: :created, location: @connection }
      else
        format.html { render :new }
        format.json { render json: @connection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /connections/1
  # PATCH/PUT /connections/1.json
  def update
    set_updated @connection
    respond_to do |format|
      if @connection.update(connection_params)
        format.html { redirect_to @connection, notice: 'Connection was successfully updated.' }
        format.json { render :show, status: :ok, location: @connection }
      else
        format.html { render :edit }
        format.json { render json: @connection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /connections/1
  # DELETE /connections/1.json
  def destroy
    @connection.destroy
    respond_to do |format|
      format.html { redirect_to connections_url, notice: 'Connection was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def set_connection id
    @connection = Connection.find_by_id(id)
    return head(:not_found) unless @connection.present?
  end

  private

    
    def connection_params
      params.require(:connection).permit(:profile_id, :connection_profile_id, :status, :created_by, :updated_by)
    end
end
