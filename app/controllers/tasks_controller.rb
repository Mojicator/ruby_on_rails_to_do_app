# frozen_string_literal: true

# Tasks Controller
class TasksController < ApplicationController
  before_action :find_list, only: %i[index create edit update destroy]
  def index
    # @task = Task.new
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    # raise @list.to_yaml
    # @task.list_id = 
    @task.added_date = Time.now
    respond_to do |format|
      if @task.save
        format.html { redirect_to tasks_path(@list), notice: 'Task was successfully created' }
        format.json { render json: @task, status: :created, location: @task }
      else
        format.html { render action: 'new', notice: 'Something went wrong' }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
  end

  def show
  end

  def destroy
  end

  private

  def find_list
    # raise @list.to_yaml
    if params[:task]
      
    else
      @list = List.find(params[:list] || params[:format] || params[:list_id])
    end
  end

  def task_params
    params.require(:task).permit(%i[title definition state added_date])
  end
end
