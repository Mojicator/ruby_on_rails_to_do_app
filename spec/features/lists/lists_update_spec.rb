# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Lists#update', type: :feature do
  before(:each) do
    @list = FactoryBot.create(:good_list)
    @user = User.find(@list.user_id)
    sign_in @user
  end
  context 'editing a lits' do
    scenario 'good path' do
      visit root_path
      find_link(href: edit_list_path(@list)).click
      # find_link(href: "/lists/#{@list.id}/edit").click
      # click_link edit_list_path(@list)
      fill_in 'list[title]', with: Faker::Book.title
      fill_in 'list[description]', with: Faker::Lorem.paragraph(sentence_count: 1)
      click_button 'Update'
      expect(page).to have_content('List was successfully updated')
    end
    scenario 'empty title' do
      visit root_path
      find_link(href: edit_list_path(@list)).click
      fill_in 'list[title]', with: nil
      fill_in 'list[description]', with: nil
      click_button 'Update'
      expect(page).to have_content('List was not valid, try again')
    end
  end
end
