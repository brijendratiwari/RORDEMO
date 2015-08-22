class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @project = Project.joins('JOIN users ON users.id = projects.users_id').select('projects.*,users.firstname,users.lastname').where('projects.id = ?',params[:id].to_i)
  end

  # GET /projects/new
  def new
    @project = Project.new
    @project_user_relations = @project.project_user_relations.build

  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create


    @project = Project.new(project_params)
   # @project.project_user_relations.build(params["project"]["project_user_relations"]["users_id"])
    respond_to do |format|
      if @project.save
        params["project"]["project_user_relations"]["user_id"].each do |data|
          if data != ''
          @project.project_user_relations.create(:user_id => data)
          end
        end
        format.html { redirect_to projects_path, notice: 'Project was successfully created.' }
        format.json { render :index, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to projects_path, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:name, :description, :start_date, :estimeted_end_date, :users_id, [ users_id:[], projects_id: :id])
    end
end
