# frozen_string_literal: true

# List Model
class List < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: false
  belongs_to :user
  has_many :tasks, dependent: :destroy
end
