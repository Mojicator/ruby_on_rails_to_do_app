# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Task#destroy', type: :feature do
  before(:each) do
    @task = FactoryBot.create(:good_task)
    @list = List.find(@task.list_id)
    @user = User.find(@list.user_id)
    sign_in @user
  end
  context 'when deleted a task' do
    scenario 'good path' do
      visit root_path
      find("a[id='show-list#{@list.id}']").click
      expect(page).to have_current_path(list_path(@list))
      find("a[id='del-task#{@task.id}']").click
      expect(page).to have_content('Task was successfully destroyed.')
    end
  end
end
