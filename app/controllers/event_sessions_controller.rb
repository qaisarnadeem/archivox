class EventSessionsController < ApplicationController
  before_action :set_event_session, only: [:show, :edit, :update, :destroy]
  before_action :require_login
  # GET /event_sessions
  # GET /event_sessions.json
  def index
    @event_sessions = EventSession.all
    @event_session=EventSession.new
  end



  # GET /event_sessions/new
  def new
    @event_session = EventSession.new
  end

  # GET /event_sessions/1/edit
  def edit
  end

  # POST /event_sessions
  # POST /event_sessions.json
  def create
    @event_session = EventSession.new(event_session_params)
    @event_session.created_by=current_user['id']
    respond_to do |format|
      if @event_session.save
        format.html { redirect_to event_sessions_path, notice: 'Event session was successfully created.' }
        format.json { render :show, status: :created, location: @event_session }
      else
        format.html { render :new }
        format.json { render json: @event_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /event_sessions/1
  # PATCH/PUT /event_sessions/1.json
  def update
    respond_to do |format|
      if @event_session.update(event_session_params)
        format.html { redirect_to event_sessions_path, notice: 'Event session was successfully updated.' }
        format.json { render :show, status: :ok, location: @event_session }
      else
        format.html { render :edit }
        format.json { render json: @event_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_sessions/1
  # DELETE /event_sessions/1.json
  def destroy
    @event_session.destroy
    respond_to do |format|
      format.html { redirect_to event_sessions_url, notice: 'Event session was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_session
      @event_session = EventSession.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_session_params
      params.require(:event_session).permit(:code, :title, :status, :created_by)
    end
end
