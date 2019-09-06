# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users#signup', type: :feature do
  before(:all) do
    @user = FactoryBot.build(:good_user)
  end
  def sign_up_form_fields(user)
    fill_in 'user[first_name]', with: user.first_name
    fill_in 'user[last_name]', with: user.last_name
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    fill_in 'user[password_confirmation]', with: user.password
    click_button 'Sign up'
  end

  def sign_up_wrong_pass_confirmation(user)
    fill_in 'user[first_name]', with: user.first_name
    fill_in 'user[last_name]', with: user.last_name
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    fill_in 'user[password_confirmation]', with: Faker::Internet.password
    click_button 'Sign up'
  end

  context 'when signed up' do
    scenario 'good path' do
      visit new_user_registration_path
      sign_up_form_fields(@user)
      expect(page).to have_content('Welcome! You have signed up successfully.')
    end
    scenario 'email has already taken' do
      visit new_user_registration_path
      sign_up_form_fields(@user)
      expect(page).to have_content('Email has already been taken')
    end
    scenario 'absence of email' do
      bad_user = FactoryBot.build(:bad_user_email)
      visit new_user_registration_path
      sign_up_form_fields(bad_user)
      expect(page).to have_content("Email can't be blank")
    end
    scenario 'absence of password' do
      bad_user = FactoryBot.build(:bad_user_password)
      visit new_user_registration_path
      sign_up_form_fields(bad_user)
      expect(page).to have_content("Password can't be blank")
    end
    scenario 'wrong password confirmation' do
      bad_user = FactoryBot.build(:good_user)
      visit new_user_registration_path
      sign_up_wrong_pass_confirmation(bad_user)
      expect(page).to have_content("Password confirmation doesn't match")
    end
  end
end
