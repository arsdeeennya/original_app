class TasksController < ApplicationController
  before_action :logged_in_user
  
  def index
    @q = current_user.tasks.ransack(params[:q])
    @tasks = @q.result(distinct: true).page(params[:page])
  end

  def show
    @task = current_user.tasks.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def edit
    @task = current_user.tasks.find(params[:id])
  end
  
  def update
    task = current_user.tasks.find(params[:id])
    task.update!(task_params)
    flash[:success] = "タスク「#{task.name}」を更新しました"
    redirect_to tasks_url
  end
  
  def destroy
    task = current_user.tasks.find(params[:id])
    task.destroy
    flash[:danger] = "タスク「#{task.name}」を削除しました"
    head :no_content
  end
  
  def create
    @task = current_user.tasks.build(task_params)
    
    if params[:back].present?
      render :new
      return
    end
    
    if @task.save
      TaskMailer.creation_email(@task).deliver_now
      flash[:success] = "タスク「#{@task.name}」を登録しました"
      redirect_to tasks_url
    else
      render 'new'
    end
  end
  
  def confirm_new
    @task = current_user.tasks.new(task_params)
    render :new unless @task.valid?
  end
  
  private
  def task_params
    params.require(:task).permit(:name, :description)
  end
end
