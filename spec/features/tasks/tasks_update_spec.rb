# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Task#update', type: :feature do
  before(:each) do
    @task = FactoryBot.create(:good_task)
    @list = List.find(@task.list_id)
    @user = User.find(@list.user_id)
    sign_in @user
  end
  context 'when updated a task' do
    scenario 'good path' do
      visit root_path
      find("a[id='show-list#{@list.id}']").click
      expect(page).to have_current_path(list_path(@list))
      find_link(href: edit_list_task_path(@list, @task)).click
      expect(page).to have_current_path(edit_list_task_path(@list, @task))
      fill_in 'task[title]', with: Faker::Verb.base + ' something'
      fill_in 'task[definition]', with: Faker::Lorem.sentence
      check 'task[state]'
      click_button 'Update'
      expect(page).to have_content('Task was successfully updated')
    end
    scenario 'empty fields' do
      visit root_path
      find("a[id='show-list#{@list.id}']").click
      find_link(href: edit_list_task_path(@list, @task)).click
      fill_in 'task[title]', with: nil
      fill_in 'task[definition]', with: nil
      click_button 'Update'
      expect(page).to have_content('Task was not valid, try again')
    end
  end
end
