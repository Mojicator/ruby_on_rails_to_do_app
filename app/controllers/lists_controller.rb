# frozen_string_literal: true

# Lists Controller
class ListsController < ApplicationController
  before_action :set_list, only: %i[show edit update destroy]
  before_action :authenticate_user!
  def index
    # @user = current_user
  end

  def new
    @list = List.new
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
  end

  def destroy
    @list.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Todolist was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_list
    @list = List.find(params[:format] || params[:id])
  end

  def list_params
    params.require(:list).permit(%i[title description created_date])
  end
end