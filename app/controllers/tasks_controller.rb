require 'pry'

class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :destroy, :update]
  before_action :set_list

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
    render :form
  end

  def edit
    render :form
  end

  def create
    @task = @list.tasks.new(task_params)

    if @task.save
      redirect_to board_list_path(@list.board_id, @list)
    else
      render :form
    end
  end

  def edit
    render :form
  end

  def update
    if @task.update(task_params)
      redirect_to board_list_path(@list.board_id, @list)
    else
      render :form
    end
  end

  def destroy
    @task.destroy
    redirect_to board_list_path(@list.board_id, @list)
  end

  private
    def set_task
      @task = Task.find(params[:id])
    end

    def set_list
      @list = List.find(params[:list_id])
    end

    def task_params
      params.require(:task).permit(:body, :priority)
    end
end
