# frozen_string_literal: true

class Chat < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
