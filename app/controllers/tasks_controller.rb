class TasksController < ApplicationController
  def index
    if params[:filter] == "completed"
      @tasks = Task.completed
    elsif params[:filter] == "incomplete"
      @tasks = Task.incomplete
    else
      @tasks = Task.all
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path, notice: 'タスクを作成しました'
    else
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to task_path(@task)
    else
      render :edit
    end
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    redirect_to tasks_path, notice: 'タスクを削除しました'
  end

  def toggle
    @task = Task.find(params[:id])
    @task.update(done: !@task.done)
    redirect_to tasks_path, notice: '完了状態を更新しました'
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :done, :due_date, :memo)
  end
end
