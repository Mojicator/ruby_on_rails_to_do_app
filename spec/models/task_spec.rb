# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Task, type: :model do
  it 'has a valid task' do
    task = FactoryBot.build(:good_task)
    expect(task).to be_valid
  end
  context 'ensures data presence' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:definition) }
  end
end
