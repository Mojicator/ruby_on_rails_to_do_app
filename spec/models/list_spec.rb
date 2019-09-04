# frozen_string_literal: true

require 'rails_helper'

RSpec.describe List, type: :model do
  # before do
  #   user = FactoryBot.create(:good_user)
  #   @list = FactoryBot.create(:good_list, user: user)
  # end
  it 'has a valid list' do
    list = FactoryBot.build(:good_list)
    expect(list).to be_valid
  end
  context 'ensures data presence' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.not_to validate_presence_of(:description) }
  end
end
