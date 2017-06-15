class SessionsController < ApplicationController
  before_action :set_session, only: [:edit, :update, :destroy]

  # GET /sessions
  # GET /sessions.json
  def index
    @sessions = Session.all
  end

  # GET /sessions/1
  # GET /sessions/1.json
  def show
    @session = Session.find_by(unique_hash: params[:unique_hash])
  end

  # GET /sessions/new
  def new
    @session = Session.new
  end

  # GET /sessions/1/edit
  def edit
  end

  # POST /sessions
  # POST /sessions.json
  def create
    @session = Session.new(session_params)

    create_slots

    respond_to do |format|
      if @session.save
        format.html { redirect_to "/sessions/#{@session.unique_hash}", notice: 'Your session was successfully created.' }
        # format.json { render :show, status: :created, location: @session }
      else
        format.html { render :new }
        # format.json { render json: @session.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sessions/1
  # PATCH/PUT /sessions/1.json
  def update

    respond_to do |format|
      if @session.update(session_params)

        create_slots
        format.html { redirect_to @session, notice: 'Your session was successfully updated.' }
        format.json { render :show, status: :ok, location: @session }
      else
        format.html { render :edit }
        format.json { render json: @session.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sessions/1
  # DELETE /sessions/1.json
  def destroy
    @session.destroy
    respond_to do |format|
      format.html { redirect_to sessions_url, notice: 'Your session was successfully removed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_session
      @session = Session.find(params[:id])
    end

    def create_slots
      number_of_slots = params.require(:session).permit(:number_of_slots)
      number_of_slots[:number_of_slots].to_i.times do
        @session.slots << Slot.new
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def session_params
      allowed_params = params.require(:session).permit(:name, :company, :about, :date, :time, )
      allowed_params[:scheduled_at] = allowed_params[:date]  + " " + allowed_params[:time]
      allowed_params.except(:date, :time)
    end

end
