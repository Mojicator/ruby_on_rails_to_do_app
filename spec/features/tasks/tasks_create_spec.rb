# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Task#create', type: :feature do
  before(:each) do
    @task = FactoryBot.build(:good_task)
    @list = List.find(@task.list_id)
    @user = User.find(@list.user_id)
    sign_in @user
  end
  context 'added a new task' do
    scenario 'good path' do
      visit root_path
      find("a[id='show-list#{@list.id}']").click
      expect(page).to have_current_path(list_path(@list))
      click_link 'Add a new task'
      expect(page).to have_current_path(new_list_task_path(@list))
      fill_in 'task[title]', with: @task.title
      fill_in 'task[definition]', with: @task.definition
      click_button 'Add task'
      expect(page).to have_content('Task was successfully created')
    end
    scenario 'empty fields' do
      visit root_path
      find("a[id='show-list#{@list.id}']").click
      click_link 'Add a new task'
      fill_in 'task[title]', with: nil
      fill_in 'task[definition]', with: nil
      click_button 'Add task'
      expect(page).to have_content('Task was not valid, try again')
    end
  end
end
