# frozen_string_literal: true

class Chat < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  after_create_commit { broadcast_append_to 'chats' }

  has_many :messages
end
