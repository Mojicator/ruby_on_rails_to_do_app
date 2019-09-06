# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User#signin', type: :feature do
  context 'when logged in' do
    scenario 'registered user' do
      user = FactoryBot.create(:good_user)
      visit root_path
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      click_button 'Log in'
      expect(page).to have_content('Signed in successfully.')
    end
    scenario 'unregistered user' do
      user = FactoryBot.build(:good_user)
      visit root_path
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      click_button 'Log in'
      expect(page).to have_content('Invalid Email or password.')
    end
  end
end
