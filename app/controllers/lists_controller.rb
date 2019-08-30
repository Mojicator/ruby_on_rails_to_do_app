# frozen_string_literal: true

# Lists Controller
class ListsController < ApplicationController
  before_action :find_list, only: %i[show edit update destroy]
  before_action :authenticate_user!
  def index
    # @task = Task.new
  end

  def new
    @list = List.new
    # @task = Task.new
  end

  def edit
  end

  def create
    @list = current_user.lists.new(list_params)
    @list.created_date = Time.now
    respond_to do |format|
      if @list.save
        format.html { redirect_to root_path, notice: 'List was successfully created' }
        format.json { render json: @list, status: :created, location: @list }
      else
        format.html { render action: 'new', notice: 'Something went wrong' }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @list.update(list_params)
        format.html { redirect_to root_path, notice: 'List was successfully updated' }
        format.json { render json: @list, status: :created, location: @list }
      else
        format.html { render action: 'edit', notice: 'Something went wrong' }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    respond_to do |format|
      format.html
      format.csv { send_data @list.tasks.to_csv(%w[title definition state]) }
      # format.csv { send_data @list.tasks.to_csv }
    end
  end

  def destroy
    @list.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Todolist was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def find_list
    # @list = List.find(params[:format] || params[:id])
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(%i[title description created_date])
  end
end
