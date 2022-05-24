class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @new_task = Task.new
  end

  def create
    @create_task = Task.new(task_params)
    @create_task.save
    redirect_to show_path(@create_task)
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @edit_task = Task.find(params[:id])
  end

  def update
    @update_task = Task.find(params[:id])
    @update_task.update(task_params)
    redirect_to show_path(@update_task)
  end

  def destroy
    @destroy_task = Task.find(params[:id])
    @destroy_task.destroy
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :details)
  end
end
