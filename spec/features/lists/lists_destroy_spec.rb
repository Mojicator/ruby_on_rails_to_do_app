# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Lists#destroy', type: :feature do
  before(:each) do
    @list = FactoryBot.create(:good_list)
    @user = User.find(@list.user_id)
    sign_in @user
  end
  context 'deleted list' do
    scenario 'good path' do
      visit root_path
      find("a[id='del-list#{@list.id}']").click
      # click_button 'Ok'
      expect(page).to have_content('Todolist was successfully destroyed.')
    end
  end
end
