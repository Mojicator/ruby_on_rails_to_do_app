# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Lists#create', type: :feature do
  before(:each) do
    @list = FactoryBot.build(:good_list)
    @user = User.find(@list.user_id)
    sign_in @user
  end
  context 'when added a list' do
    scenario 'good path' do
      visit root_path
      click_link 'Add a new list'
      fill_in 'list[title]', with: @list.title
      fill_in 'list[description]', with: @list.description
      click_button 'Add list'
      expect(page).to have_content('List was successfully created')
    end
    scenario 'empty title' do
      visit root_path
      click_link 'Add a new list'
      fill_in 'list[title]', with: nil
      fill_in 'list[description]', with: @list.description
      click_button 'Add list'
      expect(page).to have_content('List was not valid, try again')
    end
  end
end
