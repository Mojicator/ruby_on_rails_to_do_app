# frozen_string_literal: true

# Task Model
class Task < ApplicationRecord
  validates :title, :definition, presence: true
  belongs_to :list

  def self.to_csv(fields = column_names)
    CSV.generate do |csv|
      csv << fields
      all.each do |result|
        csv << result.attributes.values_at(*fields)
      end
    end
  end
end
