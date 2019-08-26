# frozen_string_literal: true

# Tasks Controller
class TasksController < ApplicationController
  before_action :find_list, only: %i[index create edit update destroy]
  def index
  end

  def new
    @task = Task.new
  end

  def create
    @task = @list.tasks.new(task_params)
    respond_to do |format|
      if @task.save
        format.html { redirect_to root_path, notice: 'Task was successfully created' }
        format.json { render json: @task, status: :created, location: @task }
      else
        format.html { render action: 'new', notice: 'Something went wrong' }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @task = @list.tasks.find(params[:id])
  end

  def update
    @task = @list.tasks.find(params[:id])
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to root_path, notice: 'Task was successfully updated' }
        format.json { render json: @task, status: :created, location: @task }
      else
        format.html { render action: 'edit', notice: 'Something went wrong' }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def destroy
    @task = @list.tasks.find(params[:id])
    @task.destroy
    redirect_to root_path
  end

  private

  def find_list
    @list = List.find(params[:list_id])
  end

  def task_params
    params.require(:task).permit(%i[title definition state added_date])
  end
end
