class ComposesController < ApplicationController
  before_filter :authenticate_user!
    
  before_action :set_compose, only: [:show, :edit, :update, :destroy]

  # GET /composes
  # GET /composes.json
  def index
    @composes = Compose.all
  end

  # GET /composes/1
  # GET /composes/1.json
  def show
  end

  # GET /composes/new
  def new
    @compose = Compose.new
  end

  # GET /composes/1/edit
  def edit
  end

  # POST /composes
  # POST /composes.json
  def create
    @entries = current_user.entries

    @compose = Compose.new(compose_params)

    respond_to do |format|
      if @compose.save
        format.html { redirect_to dashboard_index_path, notice: 'Email(s) were sent successfully.' }
        format.json { render :show, status: :created, location: @compose }
      else
        format.html { render :new }
        format.json { render json: @compose.errors, status: :unprocessable_entity }
      end
    end
      
          @entries.each do |entry| 
            UserMailer.message_user(entry, @compose).deliver
              
          end
      end


  # PATCH/PUT /composes/1
  # PATCH/PUT /composes/1.json
  def update
    respond_to do |format|
      if @compose.update(compose_params)
        format.html { redirect_to @compose, notice: 'Compose was successfully updated.' }
        format.json { render :show, status: :ok, location: @compose }
      else
        format.html { render :edit }
        format.json { render json: @compose.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /composes/1
  # DELETE /composes/1.json
  def destroy
    @compose.destroy
    respond_to do |format|
      format.html { redirect_to composes_url, notice: 'Compose was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_compose
      @compose = Compose.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def compose_params
      params.require(:compose).permit(:name, :email, :subject, :message)
    end
    
    def entry_params
      params.require(:entry).permit(:name, :email)
    end
end
