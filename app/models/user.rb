# frozen_string_literal: true

# User Model
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :first_name, :last_name, :email, presence: true
  validates :password, presence: true, on: :create
  # validates :current_password, presence: true, on: :update
  validates :description, presence: false
  has_one_attached :photo
  has_many :lists
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
