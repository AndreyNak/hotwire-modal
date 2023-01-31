# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :messages
  has_many :notifications, as: :recipient, dependent: :destroy

  scope :all_except, ->(user) { where.not(id: user) }
end
