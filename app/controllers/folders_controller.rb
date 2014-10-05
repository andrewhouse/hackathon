class FoldersController < ApplicationController
  before_action :set_folder, only: [:show, :edit, :update, :destroy]

  # GET /folders
  # GET /folders.json
  def index
    authorize! :read, Folder
    @folders = current_employee.folders.all
  end

  # GET /folders/1
  # GET /folders/1.json
  def show
    authentication_check unless current_employee
  end

  # GET /folders/new
  def new
    authorize! :modify, @folder
    @folder = Folder.new
  end

  # GET /folders/1/edit
  def edit
    authorize! :modify, @folder
  end

  # POST /folders
  # POST /folders.json
  def create
    authorize! :modify, Folder
    @folder = current_employee.folders.new(folder_params)

    respond_to do |format|
      if @folder.save
        format.html { redirect_to @folder, notice: 'Folder was successfully created.' }
        format.json { render :show, status: :created, location: @folder }
      else
        format.html { render :new }
        format.json { render json: @folder.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /folders/1
  # PATCH/PUT /folders/1.json
  def update
    authorize! :modify, @folder
    respond_to do |format|
      if @folder.update(folder_params)
        format.html { redirect_to @folder, notice: 'Folder was successfully updated.' }
        format.json { render :show, status: :ok, location: @folder }
      else
        format.html { render :edit }
        format.json { render json: @folder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /folders/1
  # DELETE /folders/1.json
  def destroy
    authorize! :modify, @folder
    @folder.destroy
    respond_to do |format|
      format.html { redirect_to folders_url, notice: 'Folder was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_folder
      @folder = Folder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def folder_params
      params.require(:folder).permit(:title, :description, :user_id, :record)
    end

    def authentication_check
      authenticate_or_request_with_http_basic do |user, password|
        user == 'me' &&  password == "test"
      end
    end
end
