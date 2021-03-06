class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: [:show, :edit, :update, :destroy]


  # GET /tasks
  # GET /tasks.json
  def index
    if params.has_key?(:user_id)
    @tasks = Task.joins(:task_project_user_relations).where('tasks.project_id = ?',params[:id]).where('task_project_user_relations.user_id = ?',params[:user_id]).select('tasks.*')
    else
      @tasks = Task.where('project_id = ?',params[:id])
    end
  end

  # GET /tasks/1
  # GET /tasks/1.json

  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
    @task_project_user_relations = @task.task_project_user_relations.build
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)
    respond_to do |format|
      if @task.save
        params["task"]["task_project_user_relations"]["users_id"].each do |data|
          if data != ''
          @task.task_project_user_relations.create(:user_id => data)
          end
        end
        format.html { redirect_to tasks_path(:id=>task_params[:project_id]), notice: 'Task was successfully created.' }
        format.json { render :index, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def updatedata
    @tasks = Task.find_by_id(params[:tasks][:id])
    if @tasks.update_attributes :status => params[:tasks][:status], :completed_by => params[:tasks][:completed_by]
      @return_data = Hash.new
      @return_data['status'] = true
      render :json => @return_data

    else
      @return_data = Hash.new
      @return_data['status'] = false
      render :json => @return_data
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @comments = Comment.where('task_id = ?',params[:id])
      @task = Task.find(params[:id])

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:name, :descriptions,:project_id,:users_id,[ users_id:[], task_id: :id])
    end
end
